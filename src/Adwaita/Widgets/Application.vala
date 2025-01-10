public class Vui.Widget.App : Adw.Application {

    public static string id;
    public static Vui.Widget.Window window;

    protected delegate Vui.Widget.Window AppWindowAction (Adw.Application app);

    public unowned AppWindowAction? content {
        set {
            this.activate.connect (() => {
                var win = this.active_window;
                if (win == null) {
                    window = value (this);
                    win = window;
                }
                win.present ();
            });
        }
    }

    public override void activate () {
        base.activate ();
    }

    public override void startup () {
        Vui.init (this.get_application_id ());
        base.startup ();
    }

    public App (string id) {
        Object (application_id : id, flags: ApplicationFlags.DEFAULT_FLAGS);
    }
}
