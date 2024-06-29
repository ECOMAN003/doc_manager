class TRoutes {
  static const login = '/login';
  static const forgetPassword = '/forgot-password/';
  static const resetPassword = '/reset-password';
  static const dashboard = '/dashboard';

  static const archiveFile = '/archive';
  static const signFile = '/sign';
  static const downloadFile = '/download';
  static const uploadFile = '/upload';
  static const settings = '/settings';

  static List sidebarMenuItems = [
    TRoutes.dashboard,
    TRoutes.archiveFile,
    TRoutes.signFile,
    TRoutes.downloadFile,
    TRoutes.uploadFile,
    TRoutes.settings,
  ];
}
