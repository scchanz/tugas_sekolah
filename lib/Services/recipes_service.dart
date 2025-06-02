import 'dart:convert';
import 'package:auth/Models/recipe.dart';
import 'package:http/http.dart' as http;

class RecipeService {
  static const String baseUrl = 'https://dummyjson.com/recipes';

  Future<List<Recipe>> getRecipes() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic> recipes = data['recipes'];
        return recipes.map((json) => Recipe.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load recipes');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<Recipe> getRecipeById(int id) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/$id'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        return Recipe.fromJson(data);
      } else {
        throw Exception('Failed to load recipe');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}