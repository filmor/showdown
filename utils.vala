namespace Showdown {

private string? read_file(File file, bool print_errors = false) {
    uint8[] text;
    bool ok = false;
    try {
        ok = file.load_contents(null, out text, null);
    } catch (Error e) {
        if (print_errors == true) {
            stderr.printf("Error: %s\n", e.message);
        }
    }
    return ok ? (string)text : null;
}

private MenuModel get_menu_from_resource(string id) {
    var builder = new Gtk.Builder();
    try {
        builder.add_from_resource("/org/showdown/menus.ui");
    } catch (Error e) {
        error("Unable to load resource: %s", e.message);
    }
    var menu = builder.get_object(id) as MenuModel;
    if (menu == null) {
        error("Unable to load menu with ID '%s'", id);
    }
    return menu;
}

}
