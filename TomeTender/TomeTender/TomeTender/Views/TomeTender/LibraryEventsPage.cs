using Xamarin.Forms;

namespace TomeTender
{
    internal class LibraryEventsPage : Page
    {
        private LibraryEvents selectedLibraryEvent;

        public LibraryEventsPage(LibraryEvents selectedLibraryEvent)
        {
            this.selectedLibraryEvent = selectedLibraryEvent;
        }
    }
}