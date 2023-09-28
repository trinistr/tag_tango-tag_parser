# frozen_string_literal: true

RSpec.describe TagTango::TagParser::Parser, :aggregate_failures do
  subject(:result) { service.call(source) }

  let(:service) { described_class.new }
  let(:value) { result.success }
  let(:failure) { result.failure }

  context "when parsing directory path" do
    let(:source) { "tag1/tag 2/tag3+/" }

    it "returns an AST" do
      expect(result).to be_success
      expect(value).to be_a(AST::Node)
    end

    it "returns an AST consisting of a list of tags" do
      expect(value.type).to be :and
      expect(value.children).to all(be_a(AST::Node))
      expect(value.children.length).to be 3
      expect(value.children.map(&:type)).to all(be :tag)
      expect(value.children.map { _1.children.first }).to eq ["tag1", "tag 2", "tag3+"]
    end

    context "with a single directory" do
      let(:source) { "/hunter2 is my password/" }

      it "returns an AST with a single tag node" do
        expect(result).to be_success
        expect(value).to be_a(AST::Node)
        expect(value.type).to be :tag
        expect(value.children.first).to eq "hunter2 is my password"
      end
    end
  end

  context "when parsing invalid string" do
    context "with plain tag" do
      let(:source) { "tag 4" }

      it "returns a Failure" do
        expect(result).to be_failure
        expect(failure).to eq :unparseable
      end
    end
  end
end
