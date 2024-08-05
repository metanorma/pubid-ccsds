shared_examples "converts pubid to pubid" do
  it "converts pubid to pubid" do
    expect(subject.to_s).to eq(pubid)
  end

  it "creates same identifier from #to_h output" do
    expect(subject.to_s).to eq(Pubid::Ccsds::Identifier.create(**subject.to_h).to_s)
  end
end

shared_examples "parse identifiers from file" do
  it "parse identifiers from file" do
    f = open("spec/fixtures/#{examples_file}")
    f.readlines.each do |pub_id|
      next if pub_id.match?("^#")

      pub_id = pub_id.split("#").first.strip.chomp
      expect do
        described_class.parse(pub_id)
      rescue Exception => failure
        raise Pubid::Core::Errors::ParseError,
              "couldn't parse #{pub_id}\n#{failure.message}"
      end.not_to raise_error

      expect(described_class.parse(pub_id).to_s.upcase).to eq(pub_id.upcase)
    end
  end
end

shared_examples "creates same identifier from #to_h output" do
  it "creates same identifier from #to_h output" do
    expect(subject.to_s).to eq(Pubid::Ccsds::Identifier.create(**subject.to_h).to_s)
  end
end
