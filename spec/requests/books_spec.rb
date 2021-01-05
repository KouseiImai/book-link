require 'rails_helper'

RSpec.describe BooksController, type: :request do

  describe "GET #index" do
    it "indexアクションにリクエストすると正常にレスポンスが返ってくる" do
      binding.pry
      get root_path
      expect(response.status).to eq 200
    end
  end
end
