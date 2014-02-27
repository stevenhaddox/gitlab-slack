require "spec_helper"

describe Message do
  let(:payload) { double }
  let(:message) { described_class.new(payload) }

  describe "#to_s" do
    let(:result) { message.to_s }

    context "for new branch" do
      let(:payload) { json_fixture "new_branch.json" }

      it "returns new branch message" do
        expect(result).to eq "Dan Sosedoff pushed new branch <http://gitlab.com/test/test-gitlab-hooks/commits/test|test> to <http://gitlab.com/test/test-gitlab-hooks|test-gitlab-hooks>"
      end
    end

    context "for deleted branch" do
      let(:payload) { json_fixture "deleted_branch.json" }

      it "returns deleted branch message" do
        expect(result).to eq "Dan Sosedoff removed branch new-branch from <http://gitlab.com/test/test-gitlab-hooks|test-gitlab-hooks>"
      end
    end
  end
end