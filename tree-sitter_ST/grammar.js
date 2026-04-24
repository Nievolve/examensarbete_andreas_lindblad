/**
 * @file For IEC 61131-3 language Structured Text
 * @author Andreas Lindblad <andreaslindblad@protonmail.com>
 * @license MIT
 */

/// <reference types="tree-sitter-cli/dsl" />
// @ts-check
module.exports = grammar({
  name: 'st', // Förkortning för Structured Text

  rules: {
    // 1. Källkodsfilen kan innehålla flera program eller funktionsblock
    source_file: $ => repeat($._definition),

    _definition: $ => choice(
      $.program_declaration,
      // Här kan vi lägga till FUNCTION_BLOCK senare
    ),

    // 2. Definition av ett PROGRAM
    program_declaration: $ => seq(
      'PROGRAM',
      $.identifier,
      optional($.variable_block),
      repeat($.statement),
      'END_PROGRAM'
    ),

    // 3. Variabelblock (VAR ... END_VAR)
    variable_block: $ => seq(
      'VAR',
      repeat($.variable_declaration),
      'END_VAR'
    ),
// hur parsern identifier Variabelblock
    variable_declaration: $ => seq(
      $.identifier,
      ':',
      $.type_identifier,
      ';'
    ),

// alla assignment ska följas av ett ;. Då blir de statemetns.
    // statements
    statement: $ => seq(
      $.assignment,
      ';'
    ),
// hur en variable deklareras ett värde.
    assignment: $ => seq(
      $.identifier,
      ':=',
      $.number
    ),

    // 5. Grundläggande byggstenar
    identifier: $ => /[a-zA-Z_][a-zA-Z0-9_]*/,
    type_identifier: $ => choice('BOOL', 'INT', 'REAL', 'DINT'),
    number: $ => /\d+/,
  }
});
