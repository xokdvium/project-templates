{
  flake.templates = {
    cpp = {
      path = ../cpp;
      description = "C++ project template";
    };

    ruby = {
      path = ../ruby;
      description = "Ruby project template";
    };

    rust = {
      path = ../rust;
      description = "Rust project template";
    };
  };
}
