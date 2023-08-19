class fieldSheet {
  static final String name = 'Name';
  static final String phoneno = 'Phone Number';
  static final String desg = 'Designation';
  static final String resg = 'Research Group';
  static final String comp = 'Complaint';
  static final String created = 'Created at';
  static final String rectify = 'Rectified at';
  static final String remark = 'Remarks';

  static List<String> getFields() =>
      [name, phoneno, desg, resg, comp, created, rectify, remark];
}

class compl {
  final String name;
  final String phoneno;
  final String desg;
  final String resg;
  final String comp;
  final String created;
  final String rectify;
  final String remark;

  const compl(
      {required this.name,
      required this.phoneno,
      required this.desg,
      required this.resg,
      required this.comp,
      required this.created,
      required this.rectify,
      required this.remark});

  Map<String, dynamic> toJson() => {
        fieldSheet.name: name,
        fieldSheet.phoneno: phoneno,
        fieldSheet.desg: desg,
        fieldSheet.resg: resg,
        fieldSheet.comp: comp,
        fieldSheet.created: created,
        fieldSheet.rectify: rectify,
        fieldSheet.remark: remark,
      };
}
