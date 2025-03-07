



enum UserType { no, admin, user, company }

enum AttachmentRefType { no, profile, companyLogo, companyImage, city, language , cv }

enum EducationLevel {
  high_school(1),
  bachelor(2),
  master(3),
  phd(4),
  middle_school(5);

  final int value;

  const EducationLevel(this.value);
}


enum WorkEngagement {
  full_time(1),
  part_time(2),
  contract(3),
  only_project(4),
  strategicPartnership(5);

  final int value;

  const WorkEngagement(this.value);
}

enum WorkLevel {
  team_leader(1),
  professional(2),
  beginner(3),
  manager(4);

  final int value;

  const WorkLevel(this.value);
}

enum WorkPostStatus {
  none,
  checking,
  approved,
}

enum WorkPlace {
  onSite(1),
  halfRemote(2),
  remote(3);

  final int value;

  const WorkPlace(this.value);
}


enum WorkApplicationStatus
{
  none,
  pending,
  approved,
  rejected
}


enum ExperienceLevel {
  no_experience(0),
  less_than_one_year(1),
  one_to_three_years(2),
  three_to_five_years(3),
  more_than_five_years(4);

  final int value;
  const ExperienceLevel(this.value);
}

enum FilterOnTime
{
  all_time(-1),
  today(1),
  this_week(2),
  this_month(3);

  final int value;

  const FilterOnTime(this.value);
}