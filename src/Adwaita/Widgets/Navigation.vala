namespace Vui.Widget {

    public class PageLink : Vui.Impl.Generic<Gtk.Button> {

        public Vui.Impl.Generic trigger {
            set {
                widget.child = value.gtk_widget;
            }
        }

        private unowned on_click_callback? on_click {
            set {
                widget.clicked.connect (() => value ());
            }
        }

        public PageLink (Vui.Impl.Generic dest) {
            widget = new Gtk.Button () {
                focus_on_click = false,
                can_focus = false
            };
            widget.css_classes = { "nav_link" };

            this.destination = { dest };
            this.on_click = () => {
                string action_name = @"$(this.destination[0].title)";
                Vui.Impl.Generic.simple_action_group.activate_action ("nav." + action_name, null);
            };
        }
    }

    // protected delegate void pass (GLib.Variant? variant);

    public class Navigation : Vui.Impl.Generic<Adw.NavigationView> {

        protected delegate void NavigationCallback (Adw.NavigationView nav);

        public Navigation bind (NavigationCallback handle) {
            handle (this.widget);
            return this;
        }

        private void add_action (string action_name, owned NavigationCallback handle) {
            var new_action = new SimpleAction ("nav." + action_name, null);
            new_action.activate.connect (() => handle (this.widget));

            Vui.Impl.Generic.simple_action_group.add_action (new_action);
        }

        public unowned NavigationCallback? on_pushed {
            set {
                widget.pushed.connect (() => {
                    value (this.widget);
                });
            }
        }

        public Vui.Impl.Generic push {
            set {
                var tmp = new Page (value.title != null ? value.title : "") {
                    content = value
                };
                widget.add (tmp.widget);
                print ("page %s added\n", tmp.widget.tag);
            }
        }

        public Vui.Impl.Generic[] pages {
            set {
                foreach (var item in value) {
                    push = item;
                }
                foreach (var item in value) {
                    foreach (var dest in item.destination) {
                        if (dest != null) {
                            push = dest;
                            add_action (dest.title, (nav) => {
                                print (@"pushing $(dest.title)");
                                this.widget.push_by_tag (dest.title);
                            });
                        }
                    }
                }
            }
        }

        public Navigation () {
            widget = new Adw.NavigationView ();
        }
    }
}
