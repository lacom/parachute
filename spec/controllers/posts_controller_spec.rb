require 'spec_helper'

describe PostsController do

  describe 'GET #show' do
    it "assigns the correct post to @post" do
      post = create(:post)
      get(:show, id: post)
      expect(assigns(:post)).to eq post
    end

    it "renders the :show template" do
      post = create(:post)
      get(:show, id: post)
      expect(response).to render_template :show
    end
  end

  describe 'GET #index' do
    it "populates an array of all posts" do
      cowbell = create(:post, title: "More Cowbell!")
      trumpet = create(:post, title: "Trumpets sounds, plz!")
      get(:index)
      expect(assigns(:posts)).to match_array([cowbell, trumpet])
    end

    it "renders the :index template" do
      get(:index)
      expect(response).to render_template :index
    end
  end

  describe 'GET #new' do
    it "assigns a new Post to @post" do
      get(:new)
      expect(assigns(:post)).to be_a_new(Post)
    end

    it "renders the :new template" do
      get(:new)
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it "saves the new post in the database" do
        expect {
          post(:create, post: attributes_for(:post, user_id: create(:user).id))
        }.to change(Post, :count).by(1)
      end

      it "redirects to posts#show" do
        post(:create, post: attributes_for(:post, user_id: create(:user).id))
        expect(response).to redirect_to post_path(assigns[:post])
      end
    end

    context 'with invalid attributes' do 
      it "does not save the new post in the database" do
        expect {
          post(:create, post: attributes_for(:invalid_post, user_id: create(:user).id))
        }.to_not change(Post, :count)
      end

      it "re-renders the :new template" do
        post(:create, post: attributes_for(:invalid_post, user_id: create(:user).id))
        expect(response).to render_template :new
      end
    end

  end

end