module Uiza
  class Category
    extend Uiza::APIOperation::Create
    extend Uiza::APIOperation::Retrieve
    extend Uiza::APIOperation::List

    OBJECT_API_PATH = "media/metadata".freeze
    OBJECT_API_DESCRIPTION_LINK = {
      create: "https://docs.uiza.io/#create-category",
      retrieve: "https://docs.uiza.io/#retrieve-category",
      list: "https://docs.uiza.io/#retrieve-category-list"
    }.freeze
  end
end
