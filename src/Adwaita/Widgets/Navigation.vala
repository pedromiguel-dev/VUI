namespace Vui.Widget {

    public class PageLink : Vui.Impl.Generic<Gtk.Button> {

        public Vui.Impl.Generic trigger {
            set {
                widget.child = value.gtk_widget;
            }
        }

        public unowned on_click_callback? on_click {
            set {
                widget.clicked.connect (() => value ());
            }
        }

        public PageLink () {
            widget = new Gtk.Button ();
            this.widget.css_classes = { "nav_link" };
            this.on_click = () => print ("Hey");
        }
    }

    // protected delegate void pass (GLib.Variant? variant);

    public class Navigation : Vui.Impl.Generic<Adw.NavigationView> {

        public Navigation bind (NavigationCallback handle) {
            handle (this.widget);
            return this;
        }

        protected delegate void NavigationCallback (Adw.NavigationView nav);

        public unowned NavigationCallback? on_pushed {
            set {
                widget.pushed.connect (() => {
                    value (this.widget);
                });
            }
        }

        // public Navigation add_action (string action_name, owned NavigationCallback handle) {
        // var new_action = new SimpleAction("nav." + action_name, null);
        // new_action.activate.connect_after (zap);

        // simple_action_group.add_action(new_action);
        // return this;
        // }

        public Vui.Widget.Page[] push_later {
            set {
                foreach (var item in value) {
                    widget.add (item.widget);
                    print ("page %s added\n", item.widget.tag);
                }
            }
        }

        public Vui.Impl.Generic[] navigation_pages {
            set {
                foreach (var item in value) {
                    var tmp = new Page (item.title != null ? item.title : "") {
                        child = item
                    };
                    widget.add (tmp.widget);
                    print ("page %s added\n", tmp.widget.tag);
                }
            }
        }

        public Navigation () {
            widget = new Adw.NavigationView ();
        }
    }
}
