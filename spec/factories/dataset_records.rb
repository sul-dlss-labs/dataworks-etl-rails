# frozen_string_literal: true

FactoryBot.define do
  factory :dataset_record do
    provider { 'redivis' }
    sequence(:dataset_id) { |n| "abc#{n}" }
    modified_token { '1.2.3' }
    sequence(:doi) { |n| "doi:10.0000/redivis.abc#{n}" }
    source_md5 { Digest::MD5.hexdigest(source.to_json) }
    sequence(:source) do |n|
      {
        name: "My dataset #{n}",
        owner: { fullName: 'Test Owner' },
        version: { tag: "v0.#{n}" },
        doi:
      }
    end
    created_at { Time.current }
    updated_at { Time.current }
  end
end
