namespace Vui {

    public static Vui.Widget.App app;
    public static SimpleActionGroup simple_action_group;
    protected static GLib.Settings gsettings;
    private static bool initialized = false;
    private static Gtk.CssProvider? base_provider = null;
    private static Gtk.CssProvider? dark_provider = null;
    private static Gtk.CssProvider? app_provider = null;

    public void save (string key, Gtk.Widget widget, string property, GLib.SettingsBindFlags flag) {
        Vui.gsettings.bind (key, widget, property, flag);
    }

    public void init (string app_id) {
        if (initialized) {
            return;
        }
        if (Vui.gsettings == null)
            Vui.gsettings = new GLib.Settings (app_id);
        Vui.simple_action_group = new SimpleActionGroup ();

        unowned var display_manager = Gdk.DisplayManager.@get ();
        display_manager.display_opened.connect (register_display);

        foreach (unowned var display in display_manager.list_displays ()) {
            register_display (display);
        }

        initialized = true;
    }

    private static void register_display (Gdk.Display display) {
        var gtk_settings = Gtk.Settings.get_for_display (display);
        gtk_settings.notify["gtk-application-prefer-dark-theme"].connect (() => {
            set_provider_for_display (display, gtk_settings.gtk_application_prefer_dark_theme);
        });

        set_provider_for_display (display, gtk_settings.gtk_application_prefer_dark_theme);
    }

    private static void set_provider_for_display (Gdk.Display display, bool prefer_dark_style) {
        if (app_provider == null) {
            var base_path = Application.get_default ().resource_base_path;
            if (base_path != null) {
                var base_uri = "resource://" + base_path;
                var base_file = File.new_for_uri (base_uri);

                app_provider = init_provider_from_file (base_file.get_child ("Application.css"));
            }

            if (app_provider != null) {
                Gtk.StyleContext.add_provider_for_display (display, app_provider, Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION);
            }
        }

        if (prefer_dark_style) {
            if (base_provider != null) {
                Gtk.StyleContext.remove_provider_for_display (display, base_provider);
            }

            if (dark_provider == null) {
                dark_provider = new Gtk.CssProvider ();
                dark_provider.load_from_resource ("/io/github/pedromigueldev/vui/vui-dark.css");
            }

            Gtk.StyleContext.add_provider_for_display (display, dark_provider, Gtk.STYLE_PROVIDER_PRIORITY_THEME);
        } else {
            if (dark_provider != null) {
                Gtk.StyleContext.remove_provider_for_display (display, dark_provider);
            }

            if (base_provider == null) {
                base_provider = new Gtk.CssProvider ();
                base_provider.load_from_resource ("/io/github/pedromigueldev/vui/vui.css");
            }

            Gtk.StyleContext.add_provider_for_display (display, base_provider, Gtk.STYLE_PROVIDER_PRIORITY_THEME);
        }
    }

    private static Gtk.CssProvider ? init_provider_from_file (File file) {
        if (file.query_exists ()) {
            var provider = new Gtk.CssProvider ();
            provider.load_from_file (file);

            return provider;
        }

        return null;
    }
}
