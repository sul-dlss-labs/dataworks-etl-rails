# frozen_string_literal: true

FactoryBot.define do
  factory :dataset_record_set do
    provider { 'redivis' }
    created_at { Time.current }
    updated_at { Time.current }

    trait :with_dataset_records do
      transient do
        dataset_records_count { 3 }
      end

      dataset_records { create_list(:dataset_record, dataset_records_count) }
    end
  end
end
