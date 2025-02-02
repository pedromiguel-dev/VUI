namespace Vui {

    public class Widget.PageLink : Widget.Button {

        public Gtk.Widget trigger {
            set {
                value.focusable = false;

                if (value is Impl.View)
                    ((Impl.View) value).focusable = false;

                this.button_widget.child = value;
            }
        }

        public PageLink (owned Impl.View destination) {
            base ();
            this.button_widget.css_classes = { "nav_link" };
            this.destination = { destination };

            this.on_click = () => {
                string action_name = @"$(this.destination[0].title)";
                simple_action_group.activate_action ("nav." + action_name, null);
            };
        }
    }

    public class Widget.Navigation : Impl.View {

        private Adw.NavigationView navigation_widget = new Adw.NavigationView () {
            hexpand = true,
            vexpand = true,
            valign = Gtk.Align.FILL,
            halign = Gtk.Align.FILL
        };

        public unowned navigation_callback? on_pushed {
            set {
                navigation_widget.pushed.connect (() => {
                    value (navigation_widget);
                });
            }
        }

        public Impl.View[] pages {
            set {
                foreach (Vui.Impl.View item in value) {
                    push_view (item);
                    foreach (Vui.Impl.View dest in item.destination) {
                        push_view (dest);
                        add_action (dest.title, (nav) => {
                            navigation_widget.push_by_tag (dest.title);
                        });
                    }
                }
            }
        }

        protected delegate void navigation_callback (Adw.NavigationView nav);

        public Navigation bind (navigation_callback handle) {
            handle (navigation_widget);
            return this;
        }

        private void add_action (string action_name, owned navigation_callback handle) {
            var new_action = new SimpleAction ("nav." + action_name, null);
            new_action.activate.connect (() => handle (navigation_widget));

            simple_action_group.add_action (new_action);
        }

        private void push_view (Vui.Impl.View view) {
            var tmp = new Adw.NavigationPage.with_tag (view, view.title, view.title);
            navigation_widget.add (tmp);
        }

        public Navigation () {
            this.set_widget (this.navigation_widget);
        }
    }
}
