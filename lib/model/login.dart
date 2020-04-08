class LoginResponse {
  int responseCode;
  String status;
  String message;
  CustomerDetails customerDetails;
  CustomerPlanDetails customerPlanDetails;
  String kylPlanPrice;

  LoginResponse(
      {this.responseCode,
        this.status,
        this.message,
        this.customerDetails,
        this.customerPlanDetails,
        this.kylPlanPrice});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    responseCode = json['responseCode'];
    status = json['status'];
    message = json['message'];
    customerDetails = json['customerDetails'] != null
        ? new CustomerDetails.fromJson(json['customerDetails'])
        : null;
    customerPlanDetails = json['customerPlanDetails'] != null
        ? new CustomerPlanDetails.fromJson(json['customerPlanDetails'])
        : null;
    kylPlanPrice = json['kylPlanPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['responseCode'] = this.responseCode;
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.customerDetails != null) {
      data['customerDetails'] = this.customerDetails.toJson();
    }
    if (this.customerPlanDetails != null) {
      data['customerPlanDetails'] = this.customerPlanDetails.toJson();
    }
    data['kylPlanPrice'] = this.kylPlanPrice;
    return data;
  }
}

class CustomerDetails {
  String customerId;
  String firstName;
  String mobileNumber;
  String email;
  String regFromCountry;
  String currencyCode;
  String currencyType;
  String userType;
  String registrationType;
  String customerstatus;
  String profileImage;
  String emailStatus;

  CustomerDetails(
      {this.customerId,
        this.firstName,
        this.mobileNumber,
        this.email,
        this.regFromCountry,
        this.currencyCode,
        this.currencyType,
        this.userType,
        this.registrationType,
        this.customerstatus,
        this.profileImage,
        this.emailStatus});

  CustomerDetails.fromJson(Map<String, dynamic> json) {
    customerId = json['customerId'];
    firstName = json['firstName'];
    mobileNumber = json['mobileNumber'];
    email = json['email'];
    regFromCountry = json['regFromCountry'];
    currencyCode = json['currencyCode'];
    currencyType = json['currencyType'];
    userType = json['userType'];
    registrationType = json['registrationType'];
    customerstatus = json['customerstatus'];
    profileImage = json['profileImage'];
    emailStatus = json['emailStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customerId'] = this.customerId;
    data['firstName'] = this.firstName;
    data['mobileNumber'] = this.mobileNumber;
    data['email'] = this.email;
    data['regFromCountry'] = this.regFromCountry;
    data['currencyCode'] = this.currencyCode;
    data['currencyType'] = this.currencyType;
    data['userType'] = this.userType;
    data['registrationType'] = this.registrationType;
    data['customerstatus'] = this.customerstatus;
    data['profileImage'] = this.profileImage;
    data['emailStatus'] = this.emailStatus;
    return data;
  }
}

class CustomerPlanDetails {
  String planId;
  String planName;
  String planSubscription;
  String remainingGeoTag;
  String remainingfileSize;
  String attributesAllowed;
  String editProperty;
  String assistYourLocation;
  String sharableLink;
  String planExpriyDate;

  CustomerPlanDetails(
      {this.planId,
        this.planName,
        this.planSubscription,
        this.remainingGeoTag,
        this.remainingfileSize,
        this.attributesAllowed,
        this.editProperty,
        this.assistYourLocation,
        this.sharableLink,
        this.planExpriyDate});

  CustomerPlanDetails.fromJson(Map<String, dynamic> json) {
    planId = json['planId'];
    planName = json['planName'];
    planSubscription = json['planSubscription'];
    remainingGeoTag = json['remainingGeoTag'];
    remainingfileSize = json['remainingfileSize'];
    attributesAllowed = json['attributesAllowed'];
    editProperty = json['editProperty'];
    assistYourLocation = json['assistYourLocation'];
    sharableLink = json['sharableLink'];
    planExpriyDate = json['planExpriyDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['planId'] = this.planId;
    data['planName'] = this.planName;
    data['planSubscription'] = this.planSubscription;
    data['remainingGeoTag'] = this.remainingGeoTag;
    data['remainingfileSize'] = this.remainingfileSize;
    data['attributesAllowed'] = this.attributesAllowed;
    data['editProperty'] = this.editProperty;
    data['assistYourLocation'] = this.assistYourLocation;
    data['sharableLink'] = this.sharableLink;
    data['planExpriyDate'] = this.planExpriyDate;
    return data;
  }
}