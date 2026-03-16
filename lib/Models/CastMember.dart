
class clsCastMember {
  final int ID;
  final String Name;
  final String? Role;
  final String? ImageUrl;

  clsCastMember({
    required this.ID,
    required this.Name,
    this.Role,
    this.ImageUrl,
  });

  factory clsCastMember.fromMap(Map<String, dynamic> map) {
    return clsCastMember(
      ID: map['ID'] ?? 0,
      Name: map['Name'] ?? '',
      Role: map['Role'],
      ImageUrl: map['ImageUrl'],
    );
  }
}
