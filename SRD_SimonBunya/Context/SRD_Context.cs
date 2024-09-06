using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using SRD_SimonBunya.Models;

namespace SRD.context;

public partial class SRD_Context : DbContext
{
    public SRD_Context()
    {
    }

    public SRD_Context(DbContextOptions<SRD_Context> options)
        : base(options)
    {
    }

    public virtual DbSet<Form> Forms { get; set; }

    public virtual DbSet<Question> Questions { get; set; }

    public virtual DbSet<QuestionType> QuestionTypes { get; set; }

    public virtual DbSet<StatusValue> StatusValues { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Server=.;Database=SRD_SimonBunya;User Id=sa;password=root85;Trusted_Connection=False;MultipleActiveResultSets=true;TrustServerCertificate=true");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Form>(entity =>
        {
            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.Key).HasMaxLength(50);
            entity.Property(e => e.Status).HasMaxLength(50);
            entity.Property(e => e.Tags).HasMaxLength(50);
            entity.Property(e => e.Title).HasMaxLength(50);

            entity.HasOne(d => d.StatusNavigation).WithMany(p => p.Forms)
                .HasForeignKey(d => d.Status)
                .HasConstraintName("FK_Forms_StatusValues");
        });

        modelBuilder.Entity<Question>(entity =>
        {
            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.FormId).HasColumnName("FormID");
            entity.Property(e => e.Key).HasMaxLength(50);
            entity.Property(e => e.QuestionType).HasMaxLength(50);
            entity.Property(e => e.Status).HasMaxLength(50);
            entity.Property(e => e.Text).HasMaxLength(50);

            entity.HasOne(d => d.Form).WithMany(p => p.Questions)
                .HasForeignKey(d => d.FormId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Questions_Forms");

            entity.HasOne(d => d.QuestionTypeNavigation).WithMany(p => p.Questions)
                .HasForeignKey(d => d.QuestionType)
                .HasConstraintName("FK_Questions_QuestionTypes");

            entity.HasOne(d => d.StatusNavigation).WithMany(p => p.Questions)
                .HasForeignKey(d => d.Status)
                .HasConstraintName("FK_Questions_StatusValues");
        });

        modelBuilder.Entity<QuestionType>(entity =>
        {
            entity.HasKey(e => e.QuestionTypes);

            entity.Property(e => e.QuestionTypes).HasMaxLength(50);
            entity.Property(e => e.Id).HasColumnName("ID");
        });

        modelBuilder.Entity<StatusValue>(entity =>
        {
            entity.HasKey(e => e.StatusValues);

            entity.Property(e => e.StatusValues).HasMaxLength(50);
            entity.Property(e => e.Id).HasColumnName("ID");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
