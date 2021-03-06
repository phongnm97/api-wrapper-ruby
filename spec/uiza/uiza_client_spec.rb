require "spec_helper"

RSpec.describe Uiza::UizaClient do
  before(:each) do
    url = "https://your-workspace-domain-api.uiza.co"
    method = %w(get post put delete).sample
    headers = {"Authorization" => "your-authorization"}
    params = {"your-params-key" => "your-params-value"}
    description_link = "https://docs.uiza.co#your-description-link"

    @uiza_client = Uiza::UizaClient.new url, method, headers, params, description_link
  end

  describe "#check_and_raise_error" do
    context "receive code 200" do
      it "should returns nil and doesn't raise any error" do
        expect(@uiza_client.send(:check_and_raise_error, 200)).to be nil
      end
    end

    context "receive code 400" do
      it "should raise BadRequestError" do
        receive_error_code @uiza_client, 400, Uiza::Error::BadRequestError,
          "The request was unacceptable, often due to missing a required parameter."
      end
    end

    context "receive code 401" do
      it "should raise UnauthorizedError" do
        receive_error_code @uiza_client, 401, Uiza::Error::UnauthorizedError,
          "No valid API key provided."
      end
    end

    context "receive code 404" do
      it "should raise NotFoundError" do
        receive_error_code @uiza_client, 404, Uiza::Error::NotFoundError,
          "The requested resource doesn't exist."
      end
    end

    context "receive code 422" do
      it "should raise UnprocessableError" do
        receive_error_code @uiza_client, 422, Uiza::Error::UnprocessableError,
          "The syntax of the request is correct (often cause of wrong parameter)."
      end
    end

    context "receive code 500" do
      it "should raise InternalServerError" do
        receive_error_code @uiza_client, 500, Uiza::Error::InternalServerError,
          "We had a problem with our server. Try again later."
      end
    end

    context "receive code 503" do
      it "should raise ServiceUnavailableError" do
        receive_error_code @uiza_client, 503, Uiza::Error::ServiceUnavailableError,
          "The server is overloaded or down for maintenance."
      end
    end

    context "receive code 4xx (example 456)" do
      it "should raise ClientError" do
        receive_error_code @uiza_client, 456, Uiza::Error::ClientError,
          "The error seems to have been caused by the client."
      end
    end

    context "receive code 5xx (example 567)" do
      it "should raise ServerError" do
        receive_error_code @uiza_client, 567, Uiza::Error::ServerError,
          "The server is aware that it has encountered an error."
      end
    end

    context "receive unknow code (example 345)" do
      it "should raise UizaError" do
        receive_error_code @uiza_client, 345, Uiza::Error::UizaError,
          "Unknow Error."
      end
    end

    def receive_error_code uiza_client, error_code, error_class, error_message
      expect{uiza_client.send(:check_and_raise_error, error_code)}.to raise_error do |error|
        expect(error).to be_a error_class
        expect(error.description_link).to eq "https://docs.uiza.co#your-description-link"
        expect(error.code).to eq error_code
        expect(error.message).to eq error_message
      end
    end
  end
end
