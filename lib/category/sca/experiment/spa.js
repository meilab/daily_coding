let c = "";
let i = 0;
const password = "1357";

while (1) {
  i = 0;
  c = getFromUser();
  for (i = 0; i < c.length; i++) {
    if (c[i] != password[i]) {
      break;
    }
  }

  if (i == password.length && password.length == c.length) {
    print("Correct password");
  }
}
