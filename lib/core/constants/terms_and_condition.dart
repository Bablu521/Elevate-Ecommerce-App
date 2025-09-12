
class TermsAndCondition {
  TermsAndCondition({
      this.termsAndConditions,});

  TermsAndCondition.fromJson(dynamic json) {
    if (json['terms_and_conditions'] != null) {
      termsAndConditions = [];
      json['terms_and_conditions'].forEach((v) {
        termsAndConditions?.add(TermsAndConditions.fromJson(v));
      });
    }
  }
  List<TermsAndConditions>? termsAndConditions;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (termsAndConditions != null) {
      map['terms_and_conditions'] = termsAndConditions?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// section : "title"
/// content : {"en":"Terms and Conditions for Flowery App","ar":"الشروط والأحكام لتطبيق فلاوري"}
/// style : {"fontSize":24,"fontWeight":"bold","color":"#D21E6A","textAlign":{"en":"center","ar":"center"},"backgroundColor":"#FFFFFF"}

class TermsAndConditions {
  TermsAndConditions({
      this.section, 
      this.content, 
      this.style,});

  TermsAndConditions.fromJson(dynamic json) {
    section = json['section'];
    content = json['content'] != null ? Content.fromJson(json['content']) : null;
    style = json['style'] != null ? Style.fromJson(json['style']) : null;
  }
  String? section;
  Content? content;
  Style? style;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['section'] = section;
    if (content != null) {
      map['content'] = content?.toJson();
    }
    if (style != null) {
      map['style'] = style?.toJson();
    }
    return map;
  }

}

/// fontSize : 24
/// fontWeight : "bold"
/// color : "#D21E6A"
/// textAlign : {"en":"center","ar":"center"}
/// backgroundColor : "#FFFFFF"

class Style {
  Style({
      this.fontSize, 
      this.fontWeight, 
      this.color, 
      this.textAlign, 
      this.backgroundColor,});

  Style.fromJson(dynamic json) {
    fontSize = json['fontSize'];
    fontWeight = json['fontWeight'];
    color = json['color'];
    textAlign = json['textAlign'] != null ? TextAlign.fromJson(json['textAlign']) : null;
    backgroundColor = json['backgroundColor'];
  }
  int? fontSize;
  String? fontWeight;
  String? color;
  TextAlign? textAlign;
  String? backgroundColor;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['fontSize'] = fontSize;
    map['fontWeight'] = fontWeight;
    map['color'] = color;
    if (textAlign != null) {
      map['textAlign'] = textAlign?.toJson();
    }
    map['backgroundColor'] = backgroundColor;
    return map;
  }

}

/// en : "center"
/// ar : "center"

class TextAlign {
  TextAlign({
      this.en, 
      this.ar,});

  TextAlign.fromJson(dynamic json) {
    en = json['en'];
    ar = json['ar'];
  }
  String? en;
  String? ar;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['en'] = en;
    map['ar'] = ar;
    return map;
  }

}

/// en : "Terms and Conditions for Flowery App"
/// ar : "الشروط والأحكام لتطبيق فلاوري"

class Content {
  Content({
      this.en, 
      this.ar,});

  Content.fromJson(dynamic json) {
    en = json['en'];
    ar = json['ar'];
  }
  String? en;
  String? ar;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['en'] = en;
    map['ar'] = ar;
    return map;
  }

}