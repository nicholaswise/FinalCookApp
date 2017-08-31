using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(CookingSite.Startup))]
namespace CookingSite
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
