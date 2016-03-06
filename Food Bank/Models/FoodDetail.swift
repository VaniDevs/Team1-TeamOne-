//
//  FoodDetail.swift
//  Food Bank
//
//  Created by Vinson Li on 2016-03-05.
//  Copyright © 2016 Team1. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift

class FoodDetail: Object, Mappable {
    dynamic var id: String?
    dynamic var brandName: String?
    dynamic var itemName: String?
    dynamic var calories: Float = 0
    dynamic var caloriesFromFat: Float = 0
    dynamic var totalFat: Float = 0
    dynamic var saturatedFat: Float = 0
    dynamic var transFat: Float = 0
    dynamic var cholesterol: Float = 0
    dynamic var sodium: Float = 0
    dynamic var totalCarbs: Float = 0
    dynamic var dietaryFiber: Float = 0
    dynamic var sugars: Float = 0
    dynamic var protein: Float = 0
    dynamic var vitaminA: Float = 0
    dynamic var vitaminC: Float = 0
    dynamic var calcium: Float = 0
    dynamic var iron: Float = 0
    dynamic var ingredient: String?
    dynamic var servingsPerContainer: Int = 0
    dynamic var updatedDate = NSDate()
    
    required convenience init?(_ map: Map) {
        self.init()
    }

    func mapping(map: Map) {
        id <- map["item_id"]
        brandName <- map["brand_name"]
        itemName <- map["item_name"]
        calories <- map["nf_calories"]
        caloriesFromFat <- map["nf_calories_from_fat"]
        totalFat <- map["nf_total_fat"]
        saturatedFat <- map["nf_saturated_fat"]
        transFat <- map["nf_trans_fatty_acid"]
        cholesterol <- map["nf_cholesterol"]
        sodium <- map["nf_sodium"]
        totalCarbs <- map["nf_total_carbohydrate"]
        dietaryFiber <- map["nf_dietary_fiber"]
        sugars <- map["nf_sugars"]
        protein <- map["nf_protein"]
        vitaminA <- map["nf_vitamin_a_dv"]
        vitaminC <- map["nf_vitamin_c_dv"]
        calcium <- map["nf_calcium_dv"]
        iron <- map["nf_iron_dv"]
        ingredient <- map["nf_ingredient_statement"]
        servingsPerContainer <- map["nf_servings_per_container"]
    }
    
    override static func primaryKey() -> String {
        return "id"
    }
}

class TopFood: FoodDetail {
    dynamic var desc: String?
    
    required convenience init?(_ map: Map) {
        self.init()
    }
    
    override func mapping(map: Map) {
        super.mapping(map)
        
        desc <- map["desc"]
    }
}
/*

{
"old_api_id": null,
"item_id": "525ec9296998a5050000097d",
"item_name": "Thai Kitchen Peanut Satay Sauce",
"leg_loc_id": null,
"brand_id": "526831023203b9c33900006c",
"brand_name": "Asian Creations",
"item_description": null,
"updated_at": "2014-11-24T20:24:24.000Z",
"nf_ingredient_statement": "Water, Coconut Milk, Sugar, Soybean Oil, Peanut, Sesame Seed, Spices (Including Red Chili Pepper, Galangal (Thai Ginger), Lemongrass), Tamarind, Salt, Modified Tapioca Starch, Shallot, Garlic, Kaffir Lime, Citric Acid.",
"nf_water_grams": null,
"nf_calories": 80,
"nf_calories_from_fat": 50,
"nf_total_fat": 5,
"nf_saturated_fat": 2.5,
"nf_trans_fatty_acid": 0,
"nf_polyunsaturated_fat": null,
"nf_monounsaturated_fat": null,
"nf_cholesterol": 0,
"nf_sodium": 220,
"nf_total_carbohydrate": 7,
"nf_dietary_fiber": 0,
"nf_sugars": 5,
"nf_protein": 1,
"nf_vitamin_a_dv": 8,
"nf_vitamin_c_dv": 0,
"nf_calcium_dv": 2,
"nf_iron_dv": 2,
"nf_refuse_pct": null,
"nf_servings_per_container": 8,
"nf_serving_size_qty": 2,
"nf_serving_size_unit": "tbsp",
"nf_serving_weight_grams": null,
"allergen_contains_milk": null,
"allergen_contains_eggs": null,
"allergen_contains_fish": null,
"allergen_contains_shellfish": null,
"allergen_contains_tree_nuts": null,
"allergen_contains_peanuts": null,
"allergen_contains_wheat": null,
"allergen_contains_soybeans": null,
"allergen_contains_gluten": null,
"usda_fields": null
}

{
"allergen_contains_eggs" = "<null>";
"allergen_contains_fish" = "<null>";
"allergen_contains_gluten" = "<null>";
"allergen_contains_milk" = "<null>";
"allergen_contains_peanuts" = "<null>";
"allergen_contains_shellfish" = "<null>";
"allergen_contains_soybeans" = "<null>";
"allergen_contains_tree_nuts" = "<null>";
"allergen_contains_wheat" = "<null>";
"brand_id" = 526831023203b9c33900006c;
"brand_name" = "Asian Creations";
"item_description" = "<null>";
"item_id" = 525ec9296998a5050000097d;
"item_name" = "Thai Kitchen Peanut Satay Sauce";
"leg_loc_id" = "<null>";
"nf_calcium_dv" = 2;
"nf_calories" = 80;
"nf_calories_from_fat" = 50;
"nf_cholesterol" = 0;
"nf_dietary_fiber" = 0;
"nf_ingredient_statement" = "Water, Coconut Milk, Sugar, Soybean Oil, Peanut, Sesame Seed, Spices (Including Red Chili Pepper, Galangal (Thai Ginger), Lemongrass), Tamarind, Salt, Modified Tapioca Starch, Shallot, Garlic, Kaffir Lime, Citric Acid.";
"nf_iron_dv" = 2;
"nf_monounsaturated_fat" = "<null>";
"nf_polyunsaturated_fat" = "<null>";
"nf_protein" = 1;
"nf_refuse_pct" = "<null>";
"nf_saturated_fat" = "2.5";
"nf_serving_size_qty" = 2;
"nf_serving_size_unit" = tbsp;
"nf_serving_weight_grams" = "<null>";
"nf_servings_per_container" = 8;
"nf_sodium" = 220;
"nf_sugars" = 5;
"nf_total_carbohydrate" = 7;
"nf_total_fat" = 5;
"nf_trans_fatty_acid" = 0;
"nf_vitamin_a_dv" = 8;
"nf_vitamin_c_dv" = 0;
"nf_water_grams" = "<null>";
"old_api_id" = "<null>";
"updated_at" = "2014-11-24T20:24:24.000Z";
"usda_fields" = "<null>";
}

*/