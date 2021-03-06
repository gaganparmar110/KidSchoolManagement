﻿// <auto-generated />
using KidManagementSystem.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;

namespace KidManagementSystem.Migrations
{
    [DbContext(typeof(KidDetailContext))]
    partial class KidDetailContextModelSnapshot : ModelSnapshot
    {
        protected override void BuildModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "3.1.3")
                .HasAnnotation("Relational:MaxIdentifierLength", 128)
                .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

            modelBuilder.Entity("KidManagementSystem.Models.Admissions", b =>
                {
                    b.Property<int>("AdmissionId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<int>("FeeInstallmentPending")
                        .HasColumnType("int");

                    b.Property<int>("StandardId")
                        .HasColumnType("int");

                    b.Property<int>("StudentId")
                        .HasColumnType("int");

                    b.HasKey("AdmissionId");

                    b.ToTable("Admission");
                });

            modelBuilder.Entity("KidManagementSystem.Models.FeesStructures", b =>
                {
                    b.Property<int>("FeeStructureId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<long>("FirstInstallment")
                        .HasColumnType("bigint");

                    b.Property<long>("SecondInstallment")
                        .HasColumnType("bigint");

                    b.Property<int>("StandardId")
                        .HasColumnType("int");

                    b.Property<long>("ThirdInstallment")
                        .HasColumnType("bigint");

                    b.HasKey("FeeStructureId");

                    b.ToTable("FeesStructure");
                });

            modelBuilder.Entity("KidManagementSystem.Models.Parents", b =>
                {
                    b.Property<int>("ParentId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<string>("Address")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("FatherName")
                        .HasColumnType("nvarchar(max)");

                    b.Property<long>("MobileNo")
                        .HasColumnType("bigint");

                    b.Property<string>("MotherName")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("ParentId");

                    b.ToTable("Parent");
                });

            modelBuilder.Entity("KidManagementSystem.Models.PayFees", b =>
                {
                    b.Property<int>("PayFeesId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<int>("AdmissionId")
                        .HasColumnType("int");

                    b.Property<long>("Fees")
                        .HasColumnType("bigint");

                    b.HasKey("PayFeesId");

                    b.ToTable("PayFee");
                });

            modelBuilder.Entity("KidManagementSystem.Models.Sessions", b =>
                {
                    b.Property<int>("SessionId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<string>("SessionName")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("SessionId");

                    b.ToTable("Session");
                });

            modelBuilder.Entity("KidManagementSystem.Models.Standards", b =>
                {
                    b.Property<int>("StandardId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<int>("SeatAvailable")
                        .HasColumnType("int");

                    b.Property<int>("SessionId")
                        .HasColumnType("int");

                    b.Property<string>("StandardName")
                        .HasColumnType("nvarchar(max)");

                    b.Property<long>("TotalFees")
                        .HasColumnType("bigint");

                    b.HasKey("StandardId");

                    b.ToTable("Standard");
                });

            modelBuilder.Entity("KidManagementSystem.Models.Students", b =>
                {
                    b.Property<int>("StudentId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<int>("Age")
                        .HasColumnType("int");

                    b.Property<int>("ParentId")
                        .HasColumnType("int");

                    b.Property<string>("StudentName")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("StudentId");

                    b.ToTable("Student");
                });
#pragma warning restore 612, 618
        }
    }
}
