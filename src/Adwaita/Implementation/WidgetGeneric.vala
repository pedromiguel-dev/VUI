namespace Vui.Impl {
    public abstract class Generic<G>: GLib.Object {

        public static Vui.Widget.App app { get { return app; } set { app = value; } }
        public static SimpleActionGroup simple_action_group = new SimpleActionGroup ();
        public static GLib.Settings gsettings;

        public virtual void save (string key, string property, GLib.SettingsBindFlags flag) {
            if (gsettings == null)
                gsettings = new GLib.Settings (Vui.Widget.App.id);
            Vui.Impl.Generic.gsettings.bind (key, this.gtk_widget, property, flag);
        }

        public virtual G widget { get; set; }

        public virtual Gtk.Widget gtk_widget {
            get { return (Gtk.Widget) widget; }
            set { widget = value; }
        }

        public string? title {
            set; get; default = null;
        }

        public Vui.Impl.Generic[] ? destination {
            set; get; default = null;
        }

        public bool[] expand {
            set {
                gtk_widget.set_vexpand (value[0]);
                gtk_widget.set_hexpand (value[1]);
            }
        }
        public bool vexpand {
            get { return gtk_widget.get_vexpand (); }
            set { gtk_widget.set_vexpand (value); }
        }
        public bool hexpand {
            get { return gtk_widget.get_hexpand (); }
            set { gtk_widget.set_hexpand (value); }
        }
        public Gtk.Align valign {
            get { return gtk_widget.valign; }
            set { gtk_widget.set_valign (value); }
        }
        public Gtk.Align halign {
            get { return gtk_widget.halign; }
            set { gtk_widget.set_halign (value); }
        }

        public int[] margins {
            set {
                gtk_widget.margin_top = value[0];
                gtk_widget.margin_start = value[1];
                gtk_widget.margin_bottom = value[2];
                gtk_widget.margin_end = value[3];
            }
        }

        public int margin_top {
            get { return gtk_widget.margin_top; }
            set { gtk_widget.margin_top = value; }
        }
        public int margin_left {
            get { return gtk_widget.margin_start; }
            set { gtk_widget.margin_start = value; }
        }
        public int margin_bottom {
            get { return gtk_widget.margin_bottom; }
            set { gtk_widget.margin_bottom = value; }
        }
        public int margin_right {
            get { return gtk_widget.margin_end; }
            set { gtk_widget.margin_end = value; }
        }

        public string[] css_classes {
            set {
                foreach (var item in value) {
                    gtk_widget.add_css_class (item);
                }
            }
        }

        public int height_request {
            get { return gtk_widget.height_request; }
            set { gtk_widget.height_request = value; }
        }
    }
}
