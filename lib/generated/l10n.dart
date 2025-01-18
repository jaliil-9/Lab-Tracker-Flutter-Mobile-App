// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Dashboard`
  String get navbar_dash {
    return Intl.message(
      'Dashboard',
      name: 'navbar_dash',
      desc: '',
      args: [],
    );
  }

  /// `Tasks`
  String get navbar_tasks {
    return Intl.message(
      'Tasks',
      name: 'navbar_tasks',
      desc: '',
      args: [],
    );
  }

  /// `Experiments`
  String get navbar_exp {
    return Intl.message(
      'Experiments',
      name: 'navbar_exp',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get navbar_set {
    return Intl.message(
      'Settings',
      name: 'navbar_set',
      desc: '',
      args: [],
    );
  }

  /// `Search...`
  String get searchbar_hint {
    return Intl.message(
      'Search...',
      name: 'searchbar_hint',
      desc: '',
      args: [],
    );
  }

  /// `Lab Tracker`
  String get dashboard_title {
    return Intl.message(
      'Lab Tracker',
      name: 'dashboard_title',
      desc: '',
      args: [],
    );
  }

  /// `Welcome! Time to make science happen.`
  String get welcome_message {
    return Intl.message(
      'Welcome! Time to make science happen.',
      name: 'welcome_message',
      desc: '',
      args: [],
    );
  }

  /// `Overview & Summary`
  String get overview_summary {
    return Intl.message(
      'Overview & Summary',
      name: 'overview_summary',
      desc: '',
      args: [],
    );
  }

  /// `Task Overview`
  String get task_overview {
    return Intl.message(
      'Task Overview',
      name: 'task_overview',
      desc: '',
      args: [],
    );
  }

  /// `Experiment Overview`
  String get experiment_overview {
    return Intl.message(
      'Experiment Overview',
      name: 'experiment_overview',
      desc: '',
      args: [],
    );
  }

  /// `Recent Activity`
  String get recent_activity {
    return Intl.message(
      'Recent Activity',
      name: 'recent_activity',
      desc: '',
      args: [],
    );
  }

  /// `Upcoming Deadlines`
  String get upcoming_deadlines {
    return Intl.message(
      'Upcoming Deadlines',
      name: 'upcoming_deadlines',
      desc: '',
      args: [],
    );
  }

  /// `Progress`
  String get progress {
    return Intl.message(
      'Progress',
      name: 'progress',
      desc: '',
      args: [],
    );
  }

  /// `% completed`
  String get percentcompleted {
    return Intl.message(
      '% completed',
      name: 'percentcompleted',
      desc: '',
      args: [],
    );
  }

  /// `Total: `
  String get total {
    return Intl.message(
      'Total: ',
      name: 'total',
      desc: '',
      args: [],
    );
  }

  /// `Ongoing: `
  String get ongoing {
    return Intl.message(
      'Ongoing: ',
      name: 'ongoing',
      desc: '',
      args: [],
    );
  }

  /// `Completed: `
  String get completed {
    return Intl.message(
      'Completed: ',
      name: 'completed',
      desc: '',
      args: [],
    );
  }

  /// `No recent activity.`
  String get no_recent_act {
    return Intl.message(
      'No recent activity.',
      name: 'no_recent_act',
      desc: '',
      args: [],
    );
  }

  /// `Due`
  String get due {
    return Intl.message(
      'Due',
      name: 'due',
      desc: '',
      args: [],
    );
  }

  /// `Timeline`
  String get timeline {
    return Intl.message(
      'Timeline',
      name: 'timeline',
      desc: '',
      args: [],
    );
  }

  /// `Task`
  String get task {
    return Intl.message(
      'Task',
      name: 'task',
      desc: '',
      args: [],
    );
  }

  /// `Experiment`
  String get experiment {
    return Intl.message(
      'Experiment',
      name: 'experiment',
      desc: '',
      args: [],
    );
  }

  /// `No upcoming deadlines.`
  String get no_upcoming_deads {
    return Intl.message(
      'No upcoming deadlines.',
      name: 'no_upcoming_deads',
      desc: '',
      args: [],
    );
  }

  /// `Tasks`
  String get tasks_title {
    return Intl.message(
      'Tasks',
      name: 'tasks_title',
      desc: '',
      args: [],
    );
  }

  /// `Add new task`
  String get add_new_task {
    return Intl.message(
      'Add new task',
      name: 'add_new_task',
      desc: '',
      args: [],
    );
  }

  /// `No details provided.`
  String get no_details_provided {
    return Intl.message(
      'No details provided.',
      name: 'no_details_provided',
      desc: '',
      args: [],
    );
  }

  /// `Quick Task`
  String get quick_task {
    return Intl.message(
      'Quick Task',
      name: 'quick_task',
      desc: '',
      args: [],
    );
  }

  /// `Heavy Task`
  String get heavy_task {
    return Intl.message(
      'Heavy Task',
      name: 'heavy_task',
      desc: '',
      args: [],
    );
  }

  /// `Enter Quick Task...`
  String get enter_quick_task {
    return Intl.message(
      'Enter Quick Task...',
      name: 'enter_quick_task',
      desc: '',
      args: [],
    );
  }

  /// `Title`
  String get form_title {
    return Intl.message(
      'Title',
      name: 'form_title',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get form_description {
    return Intl.message(
      'Description',
      name: 'form_description',
      desc: '',
      args: [],
    );
  }

  /// `Deadline:`
  String get form_deadline {
    return Intl.message(
      'Deadline:',
      name: 'form_deadline',
      desc: '',
      args: [],
    );
  }

  /// `No Date Chosen!`
  String get form_no_date_chosen {
    return Intl.message(
      'No Date Chosen!',
      name: 'form_no_date_chosen',
      desc: '',
      args: [],
    );
  }

  /// `Choose Date`
  String get form_choose_date {
    return Intl.message(
      'Choose Date',
      name: 'form_choose_date',
      desc: '',
      args: [],
    );
  }

  /// `Add Task`
  String get form_add_task {
    return Intl.message(
      'Add Task',
      name: 'form_add_task',
      desc: '',
      args: [],
    );
  }

  /// `No description provided.`
  String get no_desc_provided {
    return Intl.message(
      'No description provided.',
      name: 'no_desc_provided',
      desc: '',
      args: [],
    );
  }

  /// `No deadline set.`
  String get no_deadline_set {
    return Intl.message(
      'No deadline set.',
      name: 'no_deadline_set',
      desc: '',
      args: [],
    );
  }

  /// `Completed`
  String get completed2 {
    return Intl.message(
      'Completed',
      name: 'completed2',
      desc: '',
      args: [],
    );
  }

  /// `Not Completed`
  String get not_completed {
    return Intl.message(
      'Not Completed',
      name: 'not_completed',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Deletion Confirmation`
  String get confirm_deletion {
    return Intl.message(
      'Deletion Confirmation',
      name: 'confirm_deletion',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to delete this item?`
  String get are_you_sure_delete {
    return Intl.message(
      'Do you want to delete this item?',
      name: 'are_you_sure_delete',
      desc: '',
      args: [],
    );
  }

  /// `Experiments`
  String get experiments_title {
    return Intl.message(
      'Experiments',
      name: 'experiments_title',
      desc: '',
      args: [],
    );
  }

  /// `Add new experiment`
  String get add_new_exp {
    return Intl.message(
      'Add new experiment',
      name: 'add_new_exp',
      desc: '',
      args: [],
    );
  }

  /// `Planned`
  String get planned_exp {
    return Intl.message(
      'Planned',
      name: 'planned_exp',
      desc: '',
      args: [],
    );
  }

  /// `Ongoing`
  String get ongoing_exp {
    return Intl.message(
      'Ongoing',
      name: 'ongoing_exp',
      desc: '',
      args: [],
    );
  }

  /// `Complete`
  String get completed_exp {
    return Intl.message(
      'Complete',
      name: 'completed_exp',
      desc: '',
      args: [],
    );
  }

  /// `Unknown`
  String get unknown_exp {
    return Intl.message(
      'Unknown',
      name: 'unknown_exp',
      desc: '',
      args: [],
    );
  }

  /// `Quick Experiment`
  String get quick_experiment {
    return Intl.message(
      'Quick Experiment',
      name: 'quick_experiment',
      desc: '',
      args: [],
    );
  }

  /// `Detailed Experiment`
  String get detailed_experiment {
    return Intl.message(
      'Detailed Experiment',
      name: 'detailed_experiment',
      desc: '',
      args: [],
    );
  }

  /// `Enter Quick Experiment...`
  String get enter_quick_exp {
    return Intl.message(
      'Enter Quick Experiment...',
      name: 'enter_quick_exp',
      desc: '',
      args: [],
    );
  }

  /// `Objective`
  String get form_objective {
    return Intl.message(
      'Objective',
      name: 'form_objective',
      desc: '',
      args: [],
    );
  }

  /// `Tools`
  String get form_tools {
    return Intl.message(
      'Tools',
      name: 'form_tools',
      desc: '',
      args: [],
    );
  }

  /// `Steps`
  String get form_steps {
    return Intl.message(
      'Steps',
      name: 'form_steps',
      desc: '',
      args: [],
    );
  }

  /// `Status`
  String get exp_status {
    return Intl.message(
      'Status',
      name: 'exp_status',
      desc: '',
      args: [],
    );
  }

  /// `Add Experiment`
  String get form_add_exp {
    return Intl.message(
      'Add Experiment',
      name: 'form_add_exp',
      desc: '',
      args: [],
    );
  }

  /// `Experiment updated successfully!`
  String get exp_updated_successfully {
    return Intl.message(
      'Experiment updated successfully!',
      name: 'exp_updated_successfully',
      desc: '',
      args: [],
    );
  }

  /// `No information provided.`
  String get no_info_provided {
    return Intl.message(
      'No information provided.',
      name: 'no_info_provided',
      desc: '',
      args: [],
    );
  }

  /// `Observations:`
  String get exp_observations {
    return Intl.message(
      'Observations:',
      name: 'exp_observations',
      desc: '',
      args: [],
    );
  }

  /// `Results:`
  String get exp_results {
    return Intl.message(
      'Results:',
      name: 'exp_results',
      desc: '',
      args: [],
    );
  }

  /// `Notes:`
  String get exp_notes {
    return Intl.message(
      'Notes:',
      name: 'exp_notes',
      desc: '',
      args: [],
    );
  }

  /// `Adding experiment...`
  String get adding_experiment {
    return Intl.message(
      'Adding experiment...',
      name: 'adding_experiment',
      desc: '',
      args: [],
    );
  }

  /// `Adding task...`
  String get adding_task {
    return Intl.message(
      'Adding task...',
      name: 'adding_task',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings_title {
    return Intl.message(
      'Settings',
      name: 'settings_title',
      desc: '',
      args: [],
    );
  }

  /// `General`
  String get general {
    return Intl.message(
      'General',
      name: 'general',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get account {
    return Intl.message(
      'Account',
      name: 'account',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Logout Confirmation`
  String get confirm_logout {
    return Intl.message(
      'Logout Confirmation',
      name: 'confirm_logout',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to log out?`
  String get are_you_sure {
    return Intl.message(
      'Are you sure you want to log out?',
      name: 'are_you_sure',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `General Settings`
  String get general_settings {
    return Intl.message(
      'General Settings',
      name: 'general_settings',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get arabic {
    return Intl.message(
      'Arabic',
      name: 'arabic',
      desc: '',
      args: [],
    );
  }

  /// `French`
  String get french {
    return Intl.message(
      'French',
      name: 'french',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Account Settings`
  String get account_settings {
    return Intl.message(
      'Account Settings',
      name: 'account_settings',
      desc: '',
      args: [],
    );
  }

  /// `Update Email`
  String get update_email {
    return Intl.message(
      'Update Email',
      name: 'update_email',
      desc: '',
      args: [],
    );
  }

  /// `New Email`
  String get new_email {
    return Intl.message(
      'New Email',
      name: 'new_email',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get change_password {
    return Intl.message(
      'Change Password',
      name: 'change_password',
      desc: '',
      args: [],
    );
  }

  /// `Current Password`
  String get current_password {
    return Intl.message(
      'Current Password',
      name: 'current_password',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get new_password {
    return Intl.message(
      'New Password',
      name: 'new_password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm New Password`
  String get confirm_new_password {
    return Intl.message(
      'Confirm New Password',
      name: 'confirm_new_password',
      desc: '',
      args: [],
    );
  }

  /// `This action is irreversible. Are you sure you want to delete your account?`
  String get irreversible {
    return Intl.message(
      'This action is irreversible. Are you sure you want to delete your account?',
      name: 'irreversible',
      desc: '',
      args: [],
    );
  }

  /// `Deleting your account will permanently remove all your data, including tasks, experiments, and settings.`
  String get deletion_explanation {
    return Intl.message(
      'Deleting your account will permanently remove all your data, including tasks, experiments, and settings.',
      name: 'deletion_explanation',
      desc: '',
      args: [],
    );
  }

  /// `Email updated successfully.`
  String get email_updated_successfully {
    return Intl.message(
      'Email updated successfully.',
      name: 'email_updated_successfully',
      desc: '',
      args: [],
    );
  }

  /// `This email is already in use.`
  String get email_already_in_use {
    return Intl.message(
      'This email is already in use.',
      name: 'email_already_in_use',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email address.`
  String get invalid_email {
    return Intl.message(
      'Invalid email address.',
      name: 'invalid_email',
      desc: '',
      args: [],
    );
  }

  /// `Please log in again to update your email.`
  String get requires_recent_login {
    return Intl.message(
      'Please log in again to update your email.',
      name: 'requires_recent_login',
      desc: '',
      args: [],
    );
  }

  /// `Email update failed.`
  String get update_failed {
    return Intl.message(
      'Email update failed.',
      name: 'update_failed',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email.`
  String get enter_valid_email {
    return Intl.message(
      'Please enter a valid email.',
      name: 'enter_valid_email',
      desc: '',
      args: [],
    );
  }

  /// `Password updated successfully.`
  String get password_updated_successfully {
    return Intl.message(
      'Password updated successfully.',
      name: 'password_updated_successfully',
      desc: '',
      args: [],
    );
  }

  /// `The password is too weak.`
  String get weak_password {
    return Intl.message(
      'The password is too weak.',
      name: 'weak_password',
      desc: '',
      args: [],
    );
  }

  /// `The current password is incorrect.`
  String get wrong_password {
    return Intl.message(
      'The current password is incorrect.',
      name: 'wrong_password',
      desc: '',
      args: [],
    );
  }

  /// `The passwords do not match.`
  String get passwords_do_not_match {
    return Intl.message(
      'The passwords do not match.',
      name: 'passwords_do_not_match',
      desc: '',
      args: [],
    );
  }

  /// `Delete Account`
  String get delete_account {
    return Intl.message(
      'Delete Account',
      name: 'delete_account',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete your account? This action is irreversible.`
  String get delete_account_confirmation {
    return Intl.message(
      'Are you sure you want to delete your account? This action is irreversible.',
      name: 'delete_account_confirmation',
      desc: '',
      args: [],
    );
  }

  /// `Your account has been deleted successfully.`
  String get account_deleted_successfully {
    return Intl.message(
      'Your account has been deleted successfully.',
      name: 'account_deleted_successfully',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred while deleting your account. Please try again later.`
  String get error_deleting_account {
    return Intl.message(
      'An error occurred while deleting your account. Please try again later.',
      name: 'error_deleting_account',
      desc: '',
      args: [],
    );
  }

  /// `An unknown error occurred. Please try again.`
  String get unknown_error {
    return Intl.message(
      'An unknown error occurred. Please try again.',
      name: 'unknown_error',
      desc: '',
      args: [],
    );
  }

  /// `Help`
  String get help {
    return Intl.message(
      'Help',
      name: 'help',
      desc: '',
      args: [],
    );
  }

  /// `Getting Started`
  String get getting_started {
    return Intl.message(
      'Getting Started',
      name: 'getting_started',
      desc: '',
      args: [],
    );
  }

  /// `Learn how to set up and use the Lab Tracker app.`
  String get learn_how {
    return Intl.message(
      'Learn how to set up and use the Lab Tracker app.',
      name: 'learn_how',
      desc: '',
      args: [],
    );
  }

  /// `FAQs`
  String get faqs {
    return Intl.message(
      'FAQs',
      name: 'faqs',
      desc: '',
      args: [],
    );
  }

  /// `Find answers to frequently asked questions.`
  String get find_answers {
    return Intl.message(
      'Find answers to frequently asked questions.',
      name: 'find_answers',
      desc: '',
      args: [],
    );
  }

  /// `Contact Support`
  String get contact_support {
    return Intl.message(
      'Contact Support',
      name: 'contact_support',
      desc: '',
      args: [],
    );
  }

  /// `Get in touch with our support team for assistance.`
  String get get_in_touch {
    return Intl.message(
      'Get in touch with our support team for assistance.',
      name: 'get_in_touch',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get about {
    return Intl.message(
      'About',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  /// `Lab Tracker is an app designed to help laboratories manage tasks, experiments, and data efficiently.`
  String get content {
    return Intl.message(
      'Lab Tracker is an app designed to help laboratories manage tasks, experiments, and data efficiently.',
      name: 'content',
      desc: '',
      args: [],
    );
  }

  /// `Version`
  String get version {
    return Intl.message(
      'Version',
      name: 'version',
      desc: '',
      args: [],
    );
  }

  /// `Developed By`
  String get dev_by {
    return Intl.message(
      'Developed By',
      name: 'dev_by',
      desc: '',
      args: [],
    );
  }

  /// `Welcome Back!`
  String get welcome_back_message {
    return Intl.message(
      'Welcome Back!',
      name: 'welcome_back_message',
      desc: '',
      args: [],
    );
  }

  /// `Let's pick up right where you left off.`
  String get follow_up_welcome {
    return Intl.message(
      'Let\'s pick up right where you left off.',
      name: 'follow_up_welcome',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to the Lab Tracker community!`
  String get first_welcome {
    return Intl.message(
      'Welcome to the Lab Tracker community!',
      name: 'first_welcome',
      desc: '',
      args: [],
    );
  }

  /// `We're thrilled to have you on board.`
  String get follow_up_first_welcome {
    return Intl.message(
      'We\'re thrilled to have you on board.',
      name: 'follow_up_first_welcome',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get sign_up {
    return Intl.message(
      'Sign Up',
      name: 'sign_up',
      desc: '',
      args: [],
    );
  }

  /// `Not a member?`
  String get not_a_member {
    return Intl.message(
      'Not a member?',
      name: 'not_a_member',
      desc: '',
      args: [],
    );
  }

  /// `Already a member?`
  String get a_member {
    return Intl.message(
      'Already a member?',
      name: 'a_member',
      desc: '',
      args: [],
    );
  }

  /// ` Register now`
  String get register_now {
    return Intl.message(
      ' Register now',
      name: 'register_now',
      desc: '',
      args: [],
    );
  }

  /// ` Login now`
  String get login_now {
    return Intl.message(
      ' Login now',
      name: 'login_now',
      desc: '',
      args: [],
    );
  }

  /// `Password Don't Match`
  String get password_dont_match {
    return Intl.message(
      'Password Don\'t Match',
      name: 'password_dont_match',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get full_name {
    return Intl.message(
      'Full Name',
      name: 'full_name',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirm_password {
    return Intl.message(
      'Confirm Password',
      name: 'confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `Continue with Google`
  String get sign_in_google {
    return Intl.message(
      'Continue with Google',
      name: 'sign_in_google',
      desc: '',
      args: [],
    );
  }

  /// `Remember Me`
  String get remember_me {
    return Intl.message(
      'Remember Me',
      name: 'remember_me',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgot_password {
    return Intl.message(
      'Forgot Password?',
      name: 'forgot_password',
      desc: '',
      args: [],
    );
  }

  /// `Or`
  String get or {
    return Intl.message(
      'Or',
      name: 'or',
      desc: '',
      args: [],
    );
  }

  /// `Reset your password`
  String get reset_password {
    return Intl.message(
      'Reset your password',
      name: 'reset_password',
      desc: '',
      args: [],
    );
  }

  /// `Don't worry, we all forget it at some point, we will send you a password reset link to your e-mail`
  String get dont_worry {
    return Intl.message(
      'Don\'t worry, we all forget it at some point, we will send you a password reset link to your e-mail',
      name: 'dont_worry',
      desc: '',
      args: [],
    );
  }

  /// `Send Reset Link`
  String get send_reset_link {
    return Intl.message(
      'Send Reset Link',
      name: 'send_reset_link',
      desc: '',
      args: [],
    );
  }

  /// `Reset link sent! Check your inbox, reset your password, then let's try again!`
  String get reset_link_sent {
    return Intl.message(
      'Reset link sent! Check your inbox, reset your password, then let\'s try again!',
      name: 'reset_link_sent',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continu {
    return Intl.message(
      'Continue',
      name: 'continu',
      desc: '',
      args: [],
    );
  }

  /// `Re-send`
  String get resend {
    return Intl.message(
      'Re-send',
      name: 'resend',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get first_name {
    return Intl.message(
      'First Name',
      name: 'first_name',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get last_name {
    return Intl.message(
      'Last Name',
      name: 'last_name',
      desc: '',
      args: [],
    );
  }

  /// `Verification e-mail sent! check your inbox to verify.`
  String get verify_email {
    return Intl.message(
      'Verification e-mail sent! check your inbox to verify.',
      name: 'verify_email',
      desc: '',
      args: [],
    );
  }

  /// `Email verified successfully! now let's start working.`
  String get verified_email {
    return Intl.message(
      'Email verified successfully! now let\'s start working.',
      name: 'verified_email',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
      Locale.fromSubtags(languageCode: 'fr'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
