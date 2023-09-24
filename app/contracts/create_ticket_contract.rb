class CreateTicketContract < Dry::Validation::Contract
  params do
    required(:ContactCenter).value(:string)
    required(:RequestNumber).value(:string)
    required(:ReferenceRequestNumber).value(:string)
    required(:VersionNumber).value(:string)
    required(:SequenceNumber).value(:string)
    required(:RequestType).value(:string)
    required(:RequestAction).value(:string)
    required(:DateTimes).hash do
      required(:RequestTakenDateTime).value(:string)
      required(:TransmissionDateTime).value(:string)
      required(:LegalDateTime).value(:string)
      required(:ResponseDueDateTime).value(:string)
      required(:RestakeDate).value(:string)
      required(:ExpirationDate).value(:string)
      required(:LPMeetingAcceptDueDate).value(:string)
      required(:OverheadBeginDate).value(:string)
      required(:OverheadEndDate).value(:string)
    end
    required(:ServiceArea).hash do
      required(:PrimaryServiceAreaCode).hash do
        required(:SACode).value(:string)
      end
      required(:AdditionalServiceAreaCodes).hash do
        required(:SACode).array(:str?)
      end
    end
    required(:Excavator).hash do
      required(:CompanyName).value(:string)
      required(:Address).value(:string)
      required(:City).value(:string)
      required(:State).value(:string)
      required(:Zip).value(:string)
      required(:Type).value(:string)
      required(:Contact).hash do
        required(:Name).value(:string)
        required(:Phone).value(:string)
        required(:Email).value(:string)
      end
      required(:FieldContact).hash do
        required(:Name).value(:string)
        required(:Phone).value(:string)
        required(:Email).value(:string)
      end
      required(:CrewOnsite).value(:bool)
    end
    required(:ExcavationInfo).hash do
      required(:TypeOfWork).value(:string)
      required(:WorkDoneFor).value(:string)
      required(:ProjectDuration).value(:string)
      required(:ProjectStartDate).value(:string)
      required(:Explosives).value(:string)
      required(:UndergroundOverhead).value(:string)
      required(:HorizontalBoring).value(:string)
      required(:Whitelined).value(:string)
      required(:LocateInstructions).value(:string)
      required(:Remarks).value(:string)
      required(:DigsiteInfo).hash do
        required(:LookupBy).value(:string)
        required(:LocationType).value(:string)
        required(:Subdivision).value(:string)
        required(:AddressInfo).hash do
          required(:State).value(:string)
          required(:County).value(:string)
          required(:Place).value(:string)
          required(:Zip).value(:string)
          required(:Address).hash do
            required(:AddressNum).array(:str?)
          end
          required(:Street).hash do
            required(:Prefix).value(:string)
            required(:Name).value(:string)
            required(:Type).value(:string)
            required(:Suffix).value(:string)
          end
        end
        required(:NearStreet).hash do
          required(:State).value(:string)
          required(:County).value(:string)
          required(:Place).value(:string)
          required(:Prefix).value(:string)
          required(:Name).value(:string)
          required(:Type).value(:string)
          required(:Suffix).value(:string)
        end
        required(:Intersection).hash do
          required(:ItoI).array(:hash) do
            required(:State).value(:string)
            required(:County).value(:string)
            required(:Place).value(:string)
            required(:Prefix).value(:string)
            required(:Name).value(:string)
            required(:Type).value(:string)
            required(:Suffix).value(:string)
          end
        end
        required(:WellKnownText).value(:string)
      end
    end
  end
end
