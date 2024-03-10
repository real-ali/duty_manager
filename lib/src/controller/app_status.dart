enum AppStatus {
  idle,
  noteCreating,
  noteCreated,
  noteFailedCreation,
  noteDeleting,
  noteDeleted,
  noteFailedDeletion,
  noteFetching,
  noteFetched,
  noteFailedFetch,
  noteModifying,
  noteModified,
  noteFailedModification,

  taskCreating,
  taskCreated,
  taskFailedCreation,
  taskDeleting,
  taskDeleted,
  taskFailedDeletion,
  taskFetching,
  taskFetched,
  taskFailedFetch,
  taskModifying,
  taskModified,
  taskFailedModification,

  notesCreating,
  notesCreated,
  notesFailedCreation,
  notesDeleting,
  notesDeleted,
  notesFailedDeletion,
  notesFetching,
  notesFetched,
  notesFailedFetch,
  notesModifying,
  notesModified,
  notesFailedModification,

  tasksCreating,
  tasksCreated,
  tasksFailedCreation,
  tasksDeleting,
  tasksDeleted,
  tasksFailedDeletion,
  tasksFetching,
  tasksFetched,
  tasksFailedFetch,
  tasksModifying,
  tasksModified,
  tasksFailedModification,

  backupCreating,
  backupCreated,
  backupFailedCreation,
  backupDeleting,
  backupDeleted,
  backupFailedDeletion,
  backupFetching,
  backupFetched,
  backupFailedFetch,
  backupModifying,
  backupModified,
  backupFailedModification,
}

extension AppStatusExt on AppStatus {
  get isIdle => this == AppStatus.idle;

  get isNoteCreating => this == AppStatus.noteCreating;
  get isNoteCreated => this == AppStatus.noteCreated;
  get isNoteFailedCreation => this == AppStatus.noteFailedCreation;
  get isNoteDeleting => this == AppStatus.noteDeleting;
  get isNoteDeleted => this == AppStatus.noteDeleted;
  get isNoteFailedDeletion => this == AppStatus.noteFailedDeletion;
  get isNoteFetching => this == AppStatus.noteFetching;
  get isNoteFetched => this == AppStatus.noteFetched;
  get isNoteFailedFetch => this == AppStatus.noteFailedFetch;
  get isNoteModifying => this == AppStatus.noteModifying;
  get isNoteModified => this == AppStatus.noteModified;
  get isNoteFailedModification => this == AppStatus.noteFailedModification;

  get isTaskCreating => this == AppStatus.taskCreating;
  get isTaskCreated => this == AppStatus.taskCreated;
  get isTaskFailedCreation => this == AppStatus.taskFailedCreation;
  get isTaskDeleting => this == AppStatus.taskDeleting;
  get isTaskDeleted => this == AppStatus.taskDeleted;
  get isTaskFailedDeletion => this == AppStatus.taskFailedDeletion;
  get isTaskFetching => this == AppStatus.taskFetching;
  get isTaskFetched => this == AppStatus.taskFetched;
  get isTaskFailedFetch => this == AppStatus.taskFailedFetch;
  get isTaskModifying => this == AppStatus.taskModifying;
  get isTaskModified => this == AppStatus.taskModified;
  get isTaskFailedModification => this == AppStatus.taskFailedModification;

  get isNotesCreating => this == AppStatus.notesCreating;
  get isNotesCreated => this == AppStatus.notesCreated;
  get isNotesFailedCreation => this == AppStatus.notesFailedCreation;
  get isNotesDeleting => this == AppStatus.notesDeleting;
  get isNotesDeleted => this == AppStatus.notesDeleted;
  get isNotesFailedDeletion => this == AppStatus.notesFailedDeletion;
  get isNotesFetching => this == AppStatus.notesFetching;
  get isNotesFetched => this == AppStatus.notesFetched;
  get isNotesFailedFetch => this == AppStatus.notesFailedFetch;
  get isNotesModifying => this == AppStatus.notesModifying;
  get isNotesModified => this == AppStatus.notesModified;
  get isNotesFailedModification => this == AppStatus.notesFailedModification;

  get isTasksCreating => this == AppStatus.tasksCreating;
  get isTasksCreated => this == AppStatus.tasksCreated;
  get isTasksFailedCreation => this == AppStatus.tasksFailedCreation;
  get isTasksDeleting => this == AppStatus.tasksDeleting;
  get isTasksDeleted => this == AppStatus.tasksDeleted;
  get isTasksFailedDeletion => this == AppStatus.tasksFailedDeletion;
  get isTasksFetching => this == AppStatus.tasksFetching;
  get isTasksFetched => this == AppStatus.tasksFetched;
  get isTasksFailedFetch => this == AppStatus.tasksFailedFetch;
  get isTasksModifying => this == AppStatus.tasksModifying;
  get isTasksModified => this == AppStatus.tasksModified;
  get isTasksFailedModification => this == AppStatus.tasksFailedModification;

  get isBackupCreating => this == AppStatus.backupCreating;
  get isBackupCreated => this == AppStatus.backupCreated;
  get isBackupFailedCreation => this == AppStatus.backupFailedCreation;
  get isBackupDeleting => this == AppStatus.backupDeleting;
  get isBackupDeleted => this == AppStatus.backupDeleted;
  get isBackupFailedDeletion => this == AppStatus.backupFailedDeletion;
  get isBackupFetching => this == AppStatus.backupFetching;
  get isBackupFetched => this == AppStatus.backupFetched;
  get isBackupFailedFetch => this == AppStatus.backupFailedFetch;
  get isBackupModifying => this == AppStatus.backupModifying;
  get isBackupModified => this == AppStatus.backupModified;
  get isBackupFailedModification => this == AppStatus.backupFailedModification;

  get isLoading {
    if (isIdle) return false;

    if (isNoteCreating) return true;
    if (isNoteDeleting) return true;
    if (isNoteFetching) return true;
    if (isNoteModifying) return true;

    if (isTaskCreating) return true;
    if (isTaskDeleting) return true;
    if (isTaskFetching) return true;
    if (isTaskModifying) return true;

    if (isNotesCreating) return true;
    if (isNotesDeleting) return true;
    if (isNotesFetching) return true;
    if (isNotesModifying) return true;

    if (isTasksCreating) return true;
    if (isTasksDeleting) return true;
    if (isTasksFetching) return true;
    if (isTasksModifying) return true;

    if (isBackupCreating) return true;
    if (isBackupDeleting) return true;
    if (isBackupFetching) return true;
    if (isBackupModifying) return true;
  }

  get isFailed {
    if (isIdle) return false;

    if (isNoteFailedCreation) return true;
    if (isNoteFailedFetch) return true;
    if (isNoteFailedDeletion) return true;
    if (isNoteFailedModification) return true;

    if (isTaskFailedCreation) return true;
    if (isTaskFailedFetch) return true;
    if (isTaskFailedDeletion) return true;
    if (isTaskFailedModification) return true;

    if (isNotesFailedCreation) return true;
    if (isNotesFailedFetch) return true;
    if (isNotesFailedDeletion) return true;
    if (isNotesFailedModification) return true;

    if (isTasksFailedCreation) return true;
    if (isTasksFailedFetch) return true;
    if (isTasksFailedDeletion) return true;
    if (isTasksFailedModification) return true;

    if (isBackupFailedCreation) return true;
    if (isBackupFailedFetch) return true;
    if (isBackupFailedDeletion) return true;
    if (isBackupFailedModification) return true;
  }

  get isSucceeded {
    if (isIdle) return false;

    if (isNoteCreated) return true;
    if (isNoteFetched) return true;
    if (isNoteDeleted) return true;
    if (isNoteModified) return true;

    if (isTaskCreated) return true;
    if (isTaskFetched) return true;
    if (isTaskDeleted) return true;
    if (isTaskModified) return true;

    if (isNotesCreated) return true;
    if (isNotesFetched) return true;
    if (isNotesDeleted) return true;
    if (isNotesModified) return true;

    if (isTasksCreated) return true;
    if (isTasksFetched) return true;
    if (isTasksDeleted) return true;
    if (isTasksModified) return true;

    if (isBackupCreated) return true;
    if (isBackupFetched) return true;
    if (isBackupDeleted) return true;
    if (isBackupModified) return true;
  }
}
