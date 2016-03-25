require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  shared_examples 'not authorized' do
    it 'should redirect to home page' do
      expect(response).to redirect_to(root_path)
    end
    it 'should return flash message "Can\'t access this page."' do
      expect(flash[:notice]).to eq("Can't access this page.")
    end
  end

  shared_examples 'not authenticated' do
    it 'should redirect to log in page' do
      expect(response).to redirect_to(new_user_session_path)
    end
    it 'should return flash message "You need to sign in or sign up before continuing."' do
      expect(flash[:alert]).to eq("You need to sign in or sign up before continuing.")
    end
  end

  shared_examples 'call method' do |method|
    it ':new' do get :new end if method == :new
    it ':index' do get :index end if method == :index
    it ':show' do get :show, {id: @post.to_param} end if method == :show
    it ':my_posts' do get :my_posts end if method == :my_posts
    it ':edit' do get :edit, {id: @post.to_param} end if method == :edit
    it ':create' do post :create, {post: @post_params} end if method == :create
    it ':update' do put :update, {id: @post.to_param, post: @post_params} end if method == :update
    it ':destroy' do delete :destroy, {id: @post.to_param} end if method == :destroy
  end

  shared_context 'as visitor not authenticated' do |method, action|
    before do
      @user = create(:user)
      @post = create(:post, user: @user)
      self.send(method, action, {id: @post.to_param})
    end
    include_examples 'not authenticated'
  end

  describe 'should call' do
    before do
      @post = create(:post)
      @post_params = attributes_for(:post)
      sign_in @post.user
    end
    context '#set_post on' do
      before do
        expect(controller).to receive(:set_post).and_call_original
      end
      [:show, :edit, :update, :destroy].each {|method| include_examples 'call method', method }
    end
    context '#authenticate_user! on' do
      before do
        expect(controller).to receive(:authenticate_user!).and_call_original
      end
      [:new, :my_posts, :edit, :create, :update, :destroy].each {|method| include_examples 'call method', method }
    end
    context '#verify_authorized on' do
      before do
        expect(controller).to receive(:verify_authorized).and_call_original
      end
      [:new, :index, :show, :my_posts, :edit, :create, :update, :destroy].each {|method| include_examples 'call method', method }
    end
  end

  describe "GET #index" do
    before do
      @user = create(:user)
      @user2 = create(:user)
      @post = create(:post, user: @user, created_at: Time.zone.now - 1.hour)
      @featured_post = create(:featured_post, user: @user, created_at: Time.zone.now - 1.minute)
      @post2 = create(:post, user: @user2, created_at: Time.zone.now)
      get :index
    end
    it "should render index view" do
      expect(response).to render_template :index
    end
    it "assigns all posts as @posts in descending order" do
      expect(assigns(:posts)).to eq([@post2, @post])
    end
    it "assigns featured post as @featured_post" do
      expect(assigns(:featured_post)).to eq(@featured_post)
    end
  end

  describe "GET #my_posts" do
    include_context 'as visitor not authenticated', :get, :my_posts
    context 'as loged in user' do
      before do
        @user = create(:user)
        @user2 = create(:user)
        @post = create(:post, user: @user, created_at: Time.zone.now - 1.hour)
        @featured_post = create(:featured_post, user: @user, created_at: Time.zone.now - 1.minute)
        @post2 = create(:post, user: @user2, created_at: Time.zone.now)
        sign_in @user
        get :my_posts
      end
      it "should render index view" do
        expect(response).to render_template :index
      end
      it "assigns all user posts as @posts in descending order" do
        expect(assigns(:posts)).to eq([@post])
      end
      it "assigns user featured post as @featured_post" do
        expect(assigns(:featured_post)).to eq(@featured_post)
      end
    end
  end

  describe "GET #show" do
    before do
      @user = create(:user)
      @post = create(:post, user: @user)
      get :show, {:id => @post.to_param}
    end
    it "should render show view" do
      expect(response).to render_template :show
    end
    it "assigns the requested post as @post" do
      expect(assigns(:post)).to eq(@post)
    end
  end

  describe "GET #new" do
    include_context 'as visitor not authenticated', :get, :new
    context 'as loged in user' do
      before do
        @user = create(:user)
        sign_in @user
        get :new
      end
      it "should render new view" do
        expect(response).to render_template :new
      end
      it "assigns new Post as @post" do
        expect(assigns(:post)).to be_a_new(Post)
      end
    end
  end

  describe "GET #edit" do
    include_context 'as visitor not authenticated', :get, :edit
    context 'as loged in user' do
      before do
        @user = create(:user)
        sign_in @user
      end
      context 'with own post' do
        before do
          @post = create(:post, user: @user)
          get :edit, {id: @post.to_param}
        end
        it "should render edit view" do
          expect(response).to render_template :edit
        end
        it "assigns post as @post" do
          expect(assigns(:post)).to eq(@post)
        end
      end
      context 'with other post' do
        before do
          @new_post = create(:post)
          get :edit, {id: @new_post.to_param}
        end
        include_examples 'not authorized'
      end
    end
  end

  describe "POST #create" do
    include_context 'as visitor not authenticated', :post , :create
    context 'as loged in user' do
      before do
        @user = create(:user)
        @post_params = attributes_for(:post)
        sign_in @user
      end
      context "with valid params" do
        it "creates a new Post" do
          expect {
            post :create, {:post => @post_params}
          }.to change(Post, :count).by(1)
        end
        it "assigns a newly created post as @post" do
          post :create, {:post => @post_params}
          expect(assigns(:post)).to be_a(Post)
          expect(assigns(:post)).to be_persisted
        end
        it "redirects to the created post" do
          post :create, {:post => @post_params}
          expect(response).to redirect_to(Post.last)
        end
      end
      context "with invalid params" do
        before do
          post :create, {:post => attributes_for(:post, title: '')}
        end
        it "assigns a newly created but unsaved post as @post" do
          expect(assigns(:post)).to be_a_new(Post)
        end
        it "re-renders the 'new' template" do
          expect(response).to render_template("new")
        end
      end
    end
  end

  describe "PUT #update" do
    include_context 'as visitor not authenticated', :put , :update
    context 'as loged in user' do
      before do
        @post = create(:post)
        sign_in @post.user
      end
      context "with valid params" do
        context 'with own post' do
          let(:new_attributes) {{title: 'New title', body: 'New body'}}
          before do
            put :update, {:id => @post.to_param, :post => new_attributes}
          end
          it "updates the requested post" do
            @post.reload
            expect(@post.title).to eq('New title')
            expect(@post.body).to eq('New body')
          end
          it "assigns the requested post as @post" do
            expect(assigns(:post)).to eq(@post)
          end
          it "redirects to the post" do
            expect(response).to redirect_to(@post)
          end
        end
        context 'with other post' do
          let(:new_attributes) {{title: 'New title', body: 'New body'}}
          before do
            @new_post = create(:post)
            put :update, {:id => @new_post.to_param, :post => new_attributes}
          end
          include_examples 'not authorized'
        end
      end
      context "with invalid params" do
        let(:new_attributes) {{ body: ''}}
        before do
          put :update, {:id => @post.to_param, :post => new_attributes}
        end
        it "assigns the post as @post" do
          expect(assigns(:post)).to eq(@post)
        end
        it "re-renders the 'edit' template" do
          expect(response).to render_template("edit")
        end
      end
    end
  end

  describe "DELETE #destroy" do
    include_context 'as visitor not authenticated', :delete , :destroy
    context 'as loged in user' do
      before do
        @post = create(:post)
        sign_in @post.user
      end
      context 'with own post' do
        it "destroys the requested post" do
          expect {
            delete :destroy, {:id => @post.to_param}
          }.to change(Post, :count).by(-1)
        end
        it "redirects to the posts list" do
          delete :destroy, {:id => @post.to_param}
          expect(response).to redirect_to(posts_url)
        end
      end
      context 'with other post' do
        before do
          @new_post = create(:post)
          delete :destroy, {:id => @new_post.to_param}
        end
        include_examples 'not authorized'
      end
    end
  end
end
