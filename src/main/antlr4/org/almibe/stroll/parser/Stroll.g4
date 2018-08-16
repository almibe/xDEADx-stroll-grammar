parser grammar Stroll;

options { tokenVocab = ModalStrollLexer; }

script
  : (assignedExpression | expression)*
;

assignedExpression
  : (VARIABLE EQUAL_SIGN)? expression
;

expression
  : NAME expressionArguements
;

expressionArguements
  : START_BRACE (entityPattern | NAME | propertyValue | IDENTITY )* END_BRACE
;

//command
//  : (newCommand | updateCommand | setCommand | deleteCommand | findCommand | simpleCommand)? EOF
//;
//
//newCommand
//  : NEW_KEYWORD NAME START_BRACE propertyOrLinkAssignments? END_BRACE
//;
//
//updateCommand
//  : UPDATE_KEYWORD IDENTITY START_BRACE propertyOrLinkAssignments? END_BRACE
//;
//
//setCommand
//  : SET_KEYWORD IDENTITY START_BRACE propertyOrLinkAssignments? END_BRACE
//;
//
//deleteCommand
//  : DELETE_KEYWORD ((IDENTITY) | (START_BRACKET IDENTITY (COMMA IDENTITY)* END_BRACKET))
//;
//
//findCommand
//  : FIND_KEYWORD NAME START_BRACE findParameters? END_BRACE
//;

entityPattern
  : '(' propertyOrLinkAssignment (',' propertyOrLinkAssignment)* ')'
;

propertyOrLinkAssignment
  : propertyAssignment | linkAssignment | linksListAssigment
;

propertyAssignment
  : NAME COLON propertyValue
;

propertyValue
  : STRING | INT | LONG | DOUBLE | BOOLEAN
;

linkAssignment
  : NAME (ARROW | FAT_ARROW) IDENTITY
;

linksListAssigment
  : NAME FAT_ARROW START_BRACKET IDENTITY (',' IDENTITY)* END_BRACKET
;

//findParameters
//  : findParameter (',' findParameter)*
//;
//
//findParameter
//  : propertyAssignment | linkAssignment | linksListAssigment | propertyExists | linkExists | propertyStartsWith | propertyRange
//;
//
//propertyExists
//  : NAME COLON UNDERSCORE
//;
//
//linkExists
//  : NAME (ARROW | FAT_ARROW) UNDERSCORE
//;
//
//propertyStartsWith
//  : NAME COLON STARTS_WITH STRING
//;
//
//propertyRange
//  : NAME COLON propertyValue TO propertyValue
//;
//
//simpleCommand
//  : NAME (START_BRACE propertyOrLinkAssignments? END_BRACE)?
//;
