class AppFirestoreCollectionNames {
  static const String users = 'users';
  static const String posts = 'posts';
  static const String comments = 'comments';
  static const String likes = 'likes';
  static const String notifications = 'notifications';
  static const String chats = 'chats';
  static const String messages = 'messages';
  static const String forms = 'forms';
  static const String sections = 'sections';
  static const String fields = 'fields';
  static const String submissions = 'submissions';
}

class AppFirestoreUsersFields {
  static const String userId = 'userId';
  static const String name = 'name';
  static const String accountType = 'accountType';
  static const String emailAddress = 'emailAddress';
  static const String fiscalCode = 'fiscalCode';
  static const String address = 'address';
}

class AppFirestoreFormsFields {
  static const String formId = 'formId';
  static const String title = 'title';
  static const String dataRetentionPeriod = 'dataRetentionPeriod';
  static const String dateAdded = 'dateAdded';
  static const String userId = 'userId';
  static const String id = 'id';
}

class AppFirestoreSectionsFields {
  static const String sectionId = 'id';
  static const String title = 'title';
  static const String formId = 'formId';
  static const String content = 'content';
  static const String scanType = 'scanType';
  static const String sectionNumber = 'sectionNumber';
}

class AppFirestoreFieldsFields {
  static const String fieldId = 'id';
  static const String label = 'label';
  static const String formId = 'formId';
  static const String keyWord = 'placeholderKeyWord';
  static const String mandatory = 'mandatory';
  static const String fieldType = 'fieldType';
  static const String docKeys = 'docKeys';
}

class AppFirestoreSubmittedFormsFields {
  static const String formId = 'formId';
  static const String id = 'id';
  static const String content = 'content';
  static const String dateWhenSubmited = 'dateWhenSubmitted';
  static const String dateToBeDeleted = 'dateWhenToBeDeleted';
  static const String firstFields = 'firstFields';
}
