String cleanPhoneNumber(String phoneNumber) {
  return phoneNumber.replaceAll(RegExp(r'\D'), ''); 
}
