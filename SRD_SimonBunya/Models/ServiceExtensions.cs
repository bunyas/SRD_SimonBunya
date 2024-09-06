using Microsoft.EntityFrameworkCore;
using SRD.context;
using SRD_SimonBunya.Data;
using SRD_SimonBunya.Models;


namespace SRD_SimonBunya.Models
{
    public static class ServiceExtensions
    {
        public static void ConfigureSRDContext(this IServiceCollection services, IConfiguration config)
        {
            var connectionString = config["ConnectionStrings:DefaultConnection"];
            services.AddDbContext<SRD_Context>(options =>
            {
                options.UseSqlServer(connectionString);
            });
        }

        public static void ConfigureApplicationDbContext(this IServiceCollection services, IConfiguration config)
        {
            var connectionString = config["ConnectionStrings:DefaultConnection"];
            services.AddDbContext<ApplicationDbContext>(options =>
            {
                options.UseSqlServer(connectionString);
            });
        }

    }
}
