require "spec_helper"

RSpec.describe Uiza::Category do
  before(:each) do
    Uiza.workspace_api_domain = "your-workspace-api-domain.uiza.co"
    Uiza.authorization = "your-authorization"
  end

  describe "::list" do
    context "API returns code 200" do
      it "should returns an array of category" do
        expected_method = :get
        expected_url = "https://your-workspace-api-domain.uiza.co/api/public/v3/media/metadata"
        expected_headers = {"Authorization" => "your-authorization"}
        mock_response = {
          data: [{
            id: "your-category-id-01",
            name: "Sample category 1"
          }, {
            id: "your-category-id-02",
            name: "Sample category 2"
          }],
          code: 200
        }

        stub_request(expected_method, expected_url)
          .with(headers: expected_headers)
          .to_return(body: mock_response.to_json)

        categories = Uiza::Category.list

        expect(categories).to be_a Array
        expect(categories.first.id).to eq "your-category-id-01"
        expect(categories.first.name).to eq "Sample category 1"
        expect(categories.last.id).to eq "your-category-id-02"
        expect(categories.last.name).to eq "Sample category 2"

        expect(WebMock).to have_requested(expected_method, expected_url)
          .with(headers: expected_headers)
      end
    end

    context "API returns code 400" do
      it "should raise BadRequestError" do
        api_return_error_code 400, Uiza::Error::BadRequestError,
          "The request was unacceptable, often due to missing a required parameter."
      end
    end

    context "API returns code 401" do
      it "should raise UnauthorizedError" do
        api_return_error_code 401, Uiza::Error::UnauthorizedError,
          "No valid API key provided."
      end
    end

    context "API returns code 404" do
      it "should raise NotFoundError" do
        api_return_error_code 404, Uiza::Error::NotFoundError,
          "The requested resource doesn't exist."
      end
    end

    context "API returns code 422" do
      it "should raise UnprocessableError" do
        api_return_error_code 422, Uiza::Error::UnprocessableError,
          "The syntax of the request is correct (often cause of wrong parameter)."
      end
    end

    context "API returns code 500" do
      it "should raise InternalServerError" do
        api_return_error_code 500, Uiza::Error::InternalServerError,
          "We had a problem with our server. Try again later."
      end
    end

    context "API returns code 503" do
      it "should raise ServiceUnavailableError" do
        api_return_error_code 503, Uiza::Error::ServiceUnavailableError,
          "The server is overloaded or down for maintenance."
      end
    end

    context "API returns code 4xx (example 456)" do
      it "should raise ClientError" do
        api_return_error_code 456, Uiza::Error::ClientError,
          "The error seems to have been caused by the client."
      end
    end

    context "API returns code 5xx (example 567)" do
      it "should raise ServerError" do
        api_return_error_code 567, Uiza::Error::ServerError,
          "The server is aware that it has encountered an error."
      end
    end

    context "API returns unknow code (example 345)" do
      it "should raise UizaError" do
        api_return_error_code 345, Uiza::Error::UizaError,
          "Unknow Error."
      end
    end
  end

  def api_return_error_code error_code, error_class, error_message
    expected_method = :get
    expected_url = "https://your-workspace-api-domain.uiza.co/api/public/v3/media/metadata"
    expected_headers = {"Authorization" => "your-authorization"}
    mock_response = {
      code: error_code
    }

    stub_request(expected_method, expected_url)
      .with(headers: expected_headers)
      .to_return(body: mock_response.to_json)

    expect{Uiza::Category.list}.to raise_error do |error|
      expect(error).to be_a error_class
      expect(error.description_link).to eq "https://docs.uiza.io/#retrieve-category-list"
      expect(error.code).to eq error_code
      expect(error.message).to eq error_message
    end

    expect(WebMock).to have_requested(expected_method, expected_url)
      .with(headers: expected_headers)
  end
end
