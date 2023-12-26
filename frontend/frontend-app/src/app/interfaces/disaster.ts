export interface Disaster {
    Disaster_ID: number;
    Disaster_name: string;
    start_date: string; // You might need to adjust the format based on your needs
    stop_date: string;
    deaths: number;
    injured: number;
    missing: number;
    air_quality: 'very low' | 'low' | 'medium' | 'high' | 'very high';
    water_quality: 'very low' | 'low' | 'medium' | 'high' | 'very high';
    Continent: 'Africa' | 'Antarctica' | 'Asia' | 'Europe' | 'North America' | 'Oceania' | 'South America';
    center_latitude: number;
    center_longitude: number;
    radius: number;
    type: 'Human' | 'Natural';
    Base_location: string;
  }

  


// Person Interface
export interface Person {
  person_id?: number; // Auto-incremented and not required for inserts
  age: number;
  person_name: string;
  person_surname: string;
  gender: 'Male' | 'Female';
  nationality: string;
  status: 'Missing' | 'Dead' | 'Injured' | 'Evacuated';
}

// Country Interface
export interface Country {
  population: number;
  GDP: bigint;
  country_name: string;
}

// Disaster Situation Interface
export interface DisasterSituation {
  RGDP: bigint;
  disasterSituationID?: number; // Auto-incremented and not required for inserts
  financial_aid: bigint;
  recovery_time: number;
  Total_cost: bigint;
  Plan_title: string;
  country_name: string;
  disaster_id: number;
}

// NGO Interface
export interface NGO {
  website: string;
  organisation_name: string;
  organisation_id?: number; // Auto-incremented and not required for inserts
  contact_num: string;
  email: string;
}

// National Emergency Agency Interface
export interface NationalEmergencyAgency {
  agency_name: string;
  country_name: string;
  website: string;
  email: string;
  contact_number: string;
}

// Disease Interface
export interface Disease {
  disease_id?: number; // Auto-incremented and not required for inserts
  disaster_situation_id: number;
  disease_name: string;
  affected: number;
  disease_type: string;
  pandemic: boolean;
}

// Building Interface
export interface Building {
  street: string;
  street_number: string;
  postal_code: string;
  disasterSituationID: number;
  monument: boolean;
  damage_type: 'DESTROYED' | 'PARTLY DESTROYED' | 'MAJOR ISSUES' | 'MINOR ISSUES';
  reconstruction_cost: number;
  constructed_year: number;
}

// Donation Center Interface
export interface DonationCenter {
  street: string;
  street_number: string;
  postal_code: string;
  country_name: string;
  closing_hour: string;
  donation_type: string;
  opening_hour: string;
}
