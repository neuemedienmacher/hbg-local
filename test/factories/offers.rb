require 'ffaker'

FactoryGirl.define do
  factory :offer do
    # required fields
    name { Faker::Lorem.words(rand(3..5)).join(' ').titleize }
    description { Faker::Lorem.paragraph(rand(4..6))[0..399] }
    next_steps { Faker::Lorem.paragraph(rand(1..3))[0..399] }
    encounter { Offer.enumerized_attributes.attributes['encounter'].values.sample }
    frequent_changes { Faker::Boolean.maybe }
    completed false
    approved false
    approved_at nil

    # optional fields
    comment { maybe Faker::Lorem.paragraph(rand(4..6))[0..799] }
    telephone { maybe Faker.numerify('#' * rand(7..11)) }
    fax { (rand(2) == 0 && telephone) ? Faker.numerify('#' * rand(7..11)) : nil }
    contact_name { maybe Faker::NameDE.name }
    email { maybe Faker::Internet.email }

    # associations
    organization
    location do
      encounter == 'independent' ? nil : (
        organization.locations.sample ||
        FactoryGirl.create(:location, organization: organization)
      )
    end

    ignore do
      website_count { rand(0..3) }
      tag_count { rand(1..3) }
      tag nil # used to get a specific tag, instead of tag_count
      language_count { rand(1..2) }
      opening_count { rand(1..5) }
    end

    after :create do |offer, evaluator|
      create_list :hyperlink, evaluator.website_count, linkable: offer
      if evaluator.tag
        offer.tags << FactoryGirl.create(:tag, name: evaluator.tag)
      else
        evaluator.tag_count.times do
          offer.tags << (
            if Tag.count != 0 && rand(2) == 0
              Tag.select(:id).all.sample
            else
              FactoryGirl.create(:tag)
            end
          )
        end
      end
      evaluator.opening_count.times do
        offer.openings << (
          if Opening.count != 0 && rand(2) == 0
            Opening.select(:id).all.sample
          else
            FactoryGirl.create(:opening)
          end
        )
      end
      evaluator.language_count.times do
        offer.languages << (
          Language.select(:id).all.sample || FactoryGirl.create(:language)
        )
      end
    end

    trait :approved do
      after :create do |offer, _evaluator|
        Offer.where(id: offer.id).update_all completed: true, approved: true, approved_at: Time.now
      end
    end
  end
end

def maybe result
  rand(2) == 0 ? nil : result
end
