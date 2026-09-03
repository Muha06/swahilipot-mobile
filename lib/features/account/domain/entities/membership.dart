enum Membership { communityMember, member, moderator, admin }

extension MembershipX on Membership {
  String get label {
    switch (this) {
      case Membership.communityMember:
        return 'Community Member';
      case Membership.member:
        return 'Member';
      case Membership.moderator:
        return 'Moderator';
      case Membership.admin:
        return 'Admin';
    }
  }

  String get toDb {
    switch (this) {
      case Membership.communityMember:
        return 'communityMember';
      case Membership.member:
        return 'member';
      case Membership.moderator:
        return 'moderator';
      case Membership.admin:
        return 'admin';
    }
  }

  static Membership fromDb(String value) {
    switch (value) {
      case 'communityMember':
        return Membership.communityMember;
      case 'member':
        return Membership.member;
      case 'moderator':
        return Membership.moderator;
      case 'admin':
        return Membership.admin;
      default:
        return Membership.communityMember;
    }
  }
}
