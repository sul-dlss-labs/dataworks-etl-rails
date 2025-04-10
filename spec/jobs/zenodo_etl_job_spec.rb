# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ZenodoEtlJob do
  let(:job) { described_class }

  let(:dataset_record_set) { create(:dataset_record_set) }

  before do
    allow(Extractors::Zenodo).to receive(:call).and_return(dataset_record_set)
    allow(TransformerLoader).to receive(:call)
  end

  it 'performs transform and load' do
    described_class.perform_now

    expect(dataset_record_set.reload.job_id).not_to be_nil
    expect(Extractors::Zenodo).to have_received(:call)
    expect(TransformerLoader).to have_received(:call).with(dataset_record_set:)
  end
end
