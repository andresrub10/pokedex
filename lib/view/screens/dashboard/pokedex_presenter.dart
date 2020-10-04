import 'package:Pokedex/model/pokedex_entry.dart';
import 'package:Pokedex/model/pokemon.dart';
import 'package:flutter/material.dart';

class PokedexPresenter extends ChangeNotifier {
  Map<int, PokedexEntry> _entries;
  Map<int, PokedexEntry> get entries => _entries;

  onViewCreated() {
    _entries = Map<int, PokedexEntry>();
    notifyListeners();
  }

  void addSeen(Pokemon pokemon) {
    if (_entries.containsKey(pokemon.number)) {
      _entries[pokemon.number].isSeen = true;
    } else {
      _entries[pokemon.number] = PokedexEntry(
          pokemonNumber: pokemon.number, isSeen: true, isCaught: false);
    }
    notifyListeners();
  }

  void addCaught(Pokemon pokemon) {
    if (_entries.containsKey(pokemon.number)) {
      _entries[pokemon.number].isCaught = true;
    }
    notifyListeners();
  }

  bool isSeen(Pokemon pokemon) {
    if (_entries.containsKey(pokemon.number)) {
      return _entries[pokemon.number].isSeen;
    } else {
      return false;
    }
  }

  bool isCaught(Pokemon pokemon) {
    if (_entries.containsKey(pokemon.number)) {
      return _entries[pokemon.number].isCaught;
    } else {
      return false;
    }
  }

  void fromScratch() {
    onViewCreated();
  }

  void allToSeen() {
    onViewCreated();
    for (int i = 0; i < 807; i++) {
      _entries[i] =
          PokedexEntry(pokemonNumber: i, isSeen: true, isCaught: false);
    }
  }

  void allToSeenAndCaught() {
    onViewCreated();
    for (int i = 0; i < 807; i++) {
      _entries[i] =
          PokedexEntry(pokemonNumber: i, isSeen: true, isCaught: true);
    }
  }
}
