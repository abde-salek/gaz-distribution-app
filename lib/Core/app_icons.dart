import 'package:flutter/material.dart';

/// Centralized icon management for the Gaz Distribution App.
/// This class contains all Material Icons used throughout the application
/// to provide consistency and easy maintenance.
class AppIcons {
  // Private constructor to prevent instantiation
  AppIcons._();

  // Navigation icons
  static const IconData home = Icons.home;
  static const IconData dashboard = Icons.dashboard;
  static const IconData person = Icons.person;
  static const IconData people = Icons.people;
  static const IconData history = Icons.history;
  static const IconData settings = Icons.settings;
  
  // Action icons
  static const IconData add = Icons.add;
  static const IconData edit = Icons.edit;
  static const IconData delete = Icons.delete;
  static const IconData search = Icons.search;
  static const IconData save = Icons.save;
  static const IconData cancel = Icons.cancel;
  
  // Currency and money icons
  static const IconData currency = Icons.attach_money;
  static const IconData payment = Icons.payment;
  static const IconData accountBalance = Icons.account_balance;
  
  // Navigation arrows
  static const IconData arrowBack = Icons.arrow_back;
  static const IconData arrowForward = Icons.arrow_forward;
  static const IconData arrowLeft = Icons.arrow_left;
  static const IconData arrowRight = Icons.arrow_right;
  
  // Status icons
  static const IconData checkCircle = Icons.check_circle;
  static const IconData error = Icons.error;
  static const IconData warning = Icons.warning;
  static const IconData info = Icons.info;
  
  // Other common icons
  static const IconData menu = Icons.menu;
  static const IconData close = Icons.close;
  static const IconData refresh = Icons.refresh;
  static const IconData sync = Icons.sync;
  static const IconData notification = Icons.notifications;
}