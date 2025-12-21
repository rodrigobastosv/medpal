sealed class BootstrapPresentationEvent {}

class FirstLaunchEvent extends BootstrapPresentationEvent {}

class UserSignedInEvent extends BootstrapPresentationEvent {}

class UserNotSignedInEvent extends BootstrapPresentationEvent {}
