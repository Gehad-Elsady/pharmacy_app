// ignore: depend_on_referenced_packages
// import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:pharmacy_app/model/cart_items.dart';
import 'package:pharmacy_app/model/medicine.dart';

class Pharmacy extends ChangeNotifier {
  //list of  Medicine items in the restaurant
  final List<Medicine> _menu = [
    //antibiotics
    Medicine(
        name: "Moxavidex 400 mg, 10 tablets",
        description:
            "Community Acquired PneumoniaSkin and skin structure infections.Intra-abdominal infections (Included in H. Pylori Regimen).Plague.Acute Bacterial Sinusitis.Acute Bacterial Exacerbation of Chronic BronchitisOdontogenic infection.",
        imageUrl: "images/antibiotics/1-.jpg",
        price: 150,
        categore: MedicineCategore.Antibiotics),
    Medicine(
      name: "Rancif 500 mg, 10 tablets ",
      description:
          "An antibiotic belonging to the group of fluoroquinolones used in the treatment of pneumonia, prostatitis, salmonella infection, shigella infection, urinary tract infection, surgical site infection, artificial joint infection, bacterial meningitis, diabetic foot infection and disease.",
      imageUrl: "images/antibiotics/2-.jpg",
      price: 40.5,
      categore: MedicineCategore.Antibiotics,
    ),
    Medicine(
      name: "Levanic 750 mg, 5 tablets",
      description:
          "Treatment of infectious and inflammatory diseases caused by microorganisms sensitive to levofloxacin:hospital pneumonia;community-acquired pneumonia;complicated urinary tract infections (including acute pyelonephritis);complicated infections of the skin and soft tissues.",
      imageUrl: "images/antibiotics/3-.jpg",
      price: 45,
      categore: MedicineCategore.Antibiotics,
    ),
    Medicine(
      name: "Tariflox 400 mg , 10 tablets",
      description:
          "infectious and inflammatory diseases of the respiratory tract (bronchitis, pneumonia);infectious and inflammatory diseases of the upper respiratory tract (sinusitis, pharyngitis, otitis media, laryngitis);",
      imageUrl: "images/antibiotics/4-.png",
      price: 28.8,
      categore: MedicineCategore.Antibiotics,
    ),
    Medicine(
      name: "Curam 312,5 mg, 75 ml",
      description:
          " Amoxicillin/Clavulanic acid is used in adults and children to treat the following infections:Middle ear and sinus infectionsRespiratory tract infections",
      imageUrl: "images/antibiotics/5-.jpg",
      price: 49,
      categore: MedicineCategore.Antibiotics,
    ),
    Medicine(
      name: "Curam 457 mg , 70 ml",
      description:
          "Amoxicillin/Clavulanic acid is used in adults and children to treat the following infectionsMiddle ear and sinus infectionsRespiratory tract infections",
      imageUrl: "images/antibiotics/6-.jpg",
      price: 58.5,
      categore: MedicineCategore.Antibiotics,
    ),
    Medicine(
      name: "Moxiflox 400 mg 10 tablets",
      description:
          "Moxifloxacin should only be used to treat this infection when the usual antibiotics cannot be used or have not worked such as:Sinusitis Long-term bronchitis",
      imageUrl: "images/antibiotics/7-.jpg",
      price: 180,
      categore: MedicineCategore.Antibiotics,
    ),
    Medicine(
      name: "E-moxiclav 312,5 mg/ per 5 ml, 60 ml",
      description:
          "Treatment of infectious and inflammatory diseases caused by sensitive pathogens: lower respiratory tract infections (bronchitis, pneumonia, pleural empyema, lung abscess); ENT infections (sinusitis, tonsillitis, otitis media);",
      imageUrl: "images/antibiotics/8-.jpg",
      price: 37,
      categore: MedicineCategore.Antibiotics,
    ),
    Medicine(
      name: "E-moxiclav 156,25 mg/ per 5 ml, 60 ml",
      description:
          "Treatment of infectious and inflammatory diseases caused by sensitive pathogens: lower respiratory tract infections (bronchitis, pneumonia, pleural empyema, lung abscess); ENT infections (sinusitis, tonsillitis, otitis media);",
      imageUrl: "images/antibiotics/9-.jpg",
      price: 23,
      categore: MedicineCategore.Antibiotics,
    ),
    Medicine(
      name: "Rame- Zithro 500 mg, 6 tablets",
      description:
          "Infectious and inflammatory diseases caused by microorganisms sensitive to the drug:infections of the upper respiratory tract and ENT organs: pharyngitis, tonsillitis, sinusitis, otitis media;",
      imageUrl: "images/antibiotics/10-.jpg",
      price: 3.5,
      categore: MedicineCategore.Antibiotics,
    ),
    Medicine(
        name: "Ibidroxil 500 mg/5 ml, 60 ml",
        description:
            "Infectious-inflammatory diseases caused by microorganisms sensitive to cefadroxil, including: diseases of the urinary tract, upper and lower respiratory tract, skin, soft tissues, bones.",
        imageUrl: "images/antibiotics/1.jpg",
        price: 20,
        categore: MedicineCategore.Antibiotics),
    Medicine(
        name: "Bacticlor 125mg/5ml, 60 ml",
        description:
            "Bacticlor is indicated for the treatment of the following infections due to susceptible microorganisms:Respiratory tract infections, including pneumonia, bronchitis, exacerbations of chronic bronchitis, pharyngitis and tonsillitis, and as part of the management of sinusitis",
        imageUrl: "images/antibiotics/2.jpg",
        price: 51,
        categore: MedicineCategore.Antibiotics),
    Medicine(
        name: "Dexatrol Eye Ointment 5 g",
        description:
            "Conjunctivitis, keratitis, blepharoconjunctivitis, keratoconjunctivitis, corneal ulcers, nonpurulent blepharitis, scleritis, episcleritis and sclera conjunctivitis.",
        imageUrl: "images/antibiotics/3.jpg",
        price: 20,
        categore: MedicineCategore.Antibiotics),
    Medicine(
        name: "Dalacin 2% vaginal cream",
        description: "Treatment of bacterial vaginosis",
        imageUrl: "images/antibiotics/4.jpg",
        price: 58.5,
        categore: MedicineCategore.Antibiotics),
    Medicine(
        name: "Ibidroxil",
        description:
            "Infectious and inflammatory diseases caused by microorganisms sensitive to cefadroxil, including: diseases of the urinary tract, upper and lower respiratory tract, skin, soft tissues, bones.",
        imageUrl: "images/antibiotics/5.jpg",
        price: 17.25,
        categore: MedicineCategore.Antibiotics),
    Medicine(
        name: "Maxipime 1gm",
        description:
            "In adults for the treatment of infections caused by pathogens sensitive to cefepime",
        imageUrl: "images/antibiotics/6.jpg",
        price: 74,
        categore: MedicineCategore.Antibiotics),
    Medicine(
        name: "Cefaxone 1g",
        description:
            "-Bacterial meningitis/n-Community acquired pneumonia/n-Hospital acquired pneumonia",
        imageUrl: "images/antibiotics/7.jpg",
        price: 47,
        categore: MedicineCategore.Antibiotics),
    Medicine(
        name: "Augram 400/57mg",
        description:
            "Broad spectrum antibiotic Bacterial infections caused by microorganisms sensitive to the drug",
        imageUrl: "images/antibiotics/8.jpg",
        price: 47,
        categore: MedicineCategore.Antibiotics),
    Medicine(
        name: "Tariflox 200 mg",
        description:
            "A broad-spectrum antimicrobial drug from the group of fluoroquinolones. ",
        imageUrl: "images/antibiotics/9.jpg",
        price: 16.8,
        categore: MedicineCategore.Antibiotics),
    Medicine(
        name: "Debacolev",
        description:
            "Treatment of infectious and inflammatory diseases caused by microorganisms sensitive to levofloxacin",
        imageUrl: "images/antibiotics/10.jpg",
        price: 48,
        categore: MedicineCategore.Antibiotics),
    Medicine(
        name: "Zisrocin 500 mg",
        description:
            "Infectious and inflammatory diseases caused by microorganisms sensitive to the drug:– infections of the upper respiratory tract and ENT organs: pharyngitis, tonsillitis, sinusitis, otitis media;",
        imageUrl: "images/antibiotics/11.jpg",
        price: 49,
        categore: MedicineCategore.Antibiotics),
    Medicine(
        name: "Epizithro 500 mg",
        description:
            "Infectious and inflammatory diseases caused by microorganisms sensitive to the drug:– infections of the upper respiratory tract and ENT organs: pharyngitis, tonsillitis, sinusitis, otitis media;",
        imageUrl: "images/antibiotics/12.jpeg",
        price: 43.5,
        categore: MedicineCategore.Antibiotics),
    Medicine(
        name: "Neozolid 600 mg 3 tablets",
        description:
            "Infectious and inflammatory diseases caused by microorganisms sensitive to azithromycin: infections of the upper respiratory tract and upper respiratory tract (tonsillitis, sinusitis, tonsillitis, pharyngitis, otitis media);",
        imageUrl: "images/antibiotics/13.jpg",
        price: 35,
        categore: MedicineCategore.Antibiotics),
    Medicine(
        name: "Ibidroxil 500 mg 8 tablets",
        description:
            "Treatment of infectious and inflammatory diseases caused by microorganisms sensitive to cefadroxil, ",
        imageUrl: "images/antibiotics/14.jpg",
        price: 20,
        categore: MedicineCategore.Antibiotics),
    Medicine(
        name: "Ibidroxil 1 gr 8 tablets",
        description:
            "Treatment of infectious and inflammatory diseases caused by microorganisms sensitive to cefadroxil",
        imageUrl: "images/antibiotics/15.jpg",
        price: 29,
        categore: MedicineCategore.Antibiotics),
    Medicine(
        name: "Clindam 300 mg 16 capsules",
        description: "Broad spectrum antibiotic.",
        imageUrl: "images/antibiotics/16.jpg",
        price: 49.5,
        categore: MedicineCategore.Antibiotics),
    Medicine(
        name: "Dermotracin spray powder 150 ml",
        description: "Combined topical antibacterial preparation.",
        imageUrl: "images/antibiotics/17.jpg",
        price: 47,
        categore: MedicineCategore.Antibiotics),
    Medicine(
        name: "Amikacin 500mg/2 ml vial",
        description: "Semi-synthetic broad-spectrum antibiotic.",
        imageUrl: "images/antibiotics/18.jpg",
        price: 23.5,
        categore: MedicineCategore.Antibiotics),
    Medicine(
        name: "Ciprofar 500 mg 10 tablets",
        description: "Broad-spectrum antimicrobial agent.",
        imageUrl: "images/antibiotics/19.jpg",
        price: 47,
        categore: MedicineCategore.Antibiotics),
    Medicine(
        name: "Farcocin ointment 20 gr",
        description:
            "Broad spectrum antibiotic. It has a bactericidal effect on pyoderma, furunculosis, ",
        imageUrl: "images/antibiotics/20.jpg",
        price: 14.5,
        categore: MedicineCategore.Antibiotics),
    Medicine(
        name: "Farcocin cream 20 gr",
        description:
            "Broad spectrum antibiotic. It has a bactericidal effect on pyoderma, furunculosis",
        imageUrl: "images/antibiotics/21.jpg",
        price: 14.5,
        categore: MedicineCategore.Antibiotics),
    Medicine(
        name: "Tavanic 500 mg 5 tablets",
        description:
            "Treatment of infectious and inflammatory diseases caused by microorganisms sensitive to levofloxacin:",
        imageUrl: "images/antibiotics/22.jpg",
        price: 134,
        categore: MedicineCategore.Antibiotics),
    Medicine(
        name: "Orchacin 0.3% eye drops 5 ml",
        description:
            "bacterial infections of the anterior part of the eye (conjunctivitis, blepharitis, blepharoconjunctivitis, including chlamydial etiology).",
        imageUrl: "images/antibiotics/23.jpg",
        price: 10,
        categore: MedicineCategore.Antibiotics),
    Medicine(
        name: "Unictam 750 mg 12 tablets",
        description:
            "Bacterial infections of various localization caused by sensitive microflora: -infections of the respiratory system (including pneumonia, chronic bronchitis, pleural empyema);",
        imageUrl: "images/antibiotics/24.jpg",
        price: 80,
        categore: MedicineCategore.Antibiotics),
    Medicine(
        name: "Unictam 1.5 gr",
        description:
            "Treatment of infectious and inflammatory diseases caused by sensitive pathogens: respiratory infections (including pneumonia, lung abscess, chronic bronchitis, pleural empyema); ",
        imageUrl: "images/antibiotics/25.jpg",
        price: 39,
        categore: MedicineCategore.Antibiotics),
    Medicine(
        name: "Unictam 375 mg 12 tablets",
        description:
            "Bacterial infections of various localization caused by sensitive microflora: -infections of the respiratory system (including pneumonia, chronic bronchitis, pleural empyema);",
        imageUrl: "images/antibiotics/26.jpg",
        price: 55,
        categore: MedicineCategore.Antibiotics),
    Medicine(
        name: "Unictam 250mg / 5ml suspension 60 ml",
        description:
            "Bacterial infections of various localization caused by sensitive microflora: -infections of the respiratory system (including pneumonia, chronic bronchitis, pleural empyema);",
        imageUrl: "images/antibiotics/27.jpg",
        price: 47.5,
        categore: MedicineCategore.Antibiotics),
    Medicine(
        name: "Unictam 750 mg 1 solution for injection",
        description:
            "Treatment of infectious and inflammatory diseases caused by sensitive pathogens: respiratory infections (including pneumonia, lung abscess, chronic bronchitis, pleural empyema);",
        imageUrl: "images/antibiotics/28.jpg",
        price: 27,
        categore: MedicineCategore.Antibiotics),
    Medicine(
        name: "Unictam 375mg 1 solution for injection",
        description:
            "Treatment of infectious and inflammatory diseases caused by sensitive pathogens: respiratory infections (including pneumonia, lung abscess, chronic bronchitis, pleural empyema);",
        imageUrl: "images/antibiotics/29.jpg",
        price: 20.5,
        categore: MedicineCategore.Antibiotics),
    Medicine(
        name: "Ceftriaxone 1000 mg 1 ampoule",
        description:
            "nfectious and inflammatory diseases caused by pathogens sensitive to ceftriaxone: sepsis, meningitis, typhoid fever, salmonellosis, disseminated Lyme borreliosis (early and late stages of the disease);",
        imageUrl: "images/antibiotics/30.jpg",
        price: 65,
        categore: MedicineCategore.Antibiotics),
    Medicine(
        name: "Polyderm cream 20 grams",
        description:
            "The cream is used for various inflammatory skin diseases:– secondary bacterial infection. – fungal infection.",
        imageUrl: "images/antibiotics/31.jpg",
        price: 13.5,
        categore: MedicineCategore.Antibiotics),
    Medicine(
        name: "Monuril 3 gr 1 sachet",
        description:
            "Bacterial urinary tract infections of various localization caused by microorganisms sensitive to fosfomycin",
        imageUrl: "images/antibiotics/32.jpg",
        price: 205,
        categore: MedicineCategore.Antibiotics),
    Medicine(
        name: "Xitrhon 200mg/5ml suspension 25ml",
        description:
            "Infectious and inflammatory diseases caused by microorganisms sensitive to the drug",
        imageUrl: "images/antibiotics/33.jpg",
        price: 61.5,
        categore: MedicineCategore.Antibiotics),
    Medicine(
        name: "Ciprofar 750 mg 10 tablets",
        description:
            "Uncomplicated and complicated infections caused by microorganisms sensitive to ciprofloxacin.",
        imageUrl: "images/antibiotics/34.jpg",
        price: 58.5,
        categore: MedicineCategore.Antibiotics),
    Medicine(
        name: "Top-flam cream 15 grams",
        description:
            "Atopic dermatitis .Seborrheic dermatitis .Simple chronic lichen.Psoriasis (including face and body).Allergic contact dermatitis.",
        imageUrl: "images/antibiotics/35.jpg",
        price: 14,
        categore: MedicineCategore.Antibiotics),
    Medicine(
        name: "Xithrone 500 mg 3 tablets",
        description:
            "Infectious and inflammatory diseases caused by microorganisms sensitive to the drug:– infections of the upper respiratory tract and ENT organs: pharyngitis, tonsillitis, sinusitis, otitis media;",
        imageUrl: "images/antibiotics/36.jpg",
        price: 42.5,
        categore: MedicineCategore.Antibiotics),
    Medicine(
        name: "Suprax 100g/5ml powder for suspension 30 ml",
        description:
            "Infectious and inflammatory diseases caused by susceptible microorganisms: pharyngitis, tonsillitis, sinusitis, acute and chronic bronchitis, otitis media, uncomplicated urinary tract infections, uncomplicated gonorrhea.",
        imageUrl: "images/antibiotics/37.jpeg",
        price: 70.5,
        categore: MedicineCategore.Antibiotics),

    //diabetes
    Medicine(
      name: 'Novorapid® Flexpen® 100 units/mL',
      description:
          'diabetes mellitus type 1 and 2 in adults, adolescents and children over 2 years of age.',
      imageUrl: 'images/diabetes/1.jpg',
      price: 853,
      categore: MedicineCategore.Diabetes,
    ),
    Medicine(
      name: 'Insulatard®Penfill® 100 units/mL',
      description: 'Type 1 diabetes mellitus;',
      imageUrl:
          'images/diabetes/✔insulatard®penfill®-100-ed_ml-5×-3-ml-1024x1024.jpg',
      price: 169,
      categore: MedicineCategore.Diabetes,
    ),
    Medicine(
      name: 'Humalog®Mix 50™KwikPen®100 IU/mL, 5',
      description: 'diabetes mellitus requiring insulin therapy.',
      imageUrl:
          'images/diabetes/✔humalog®miks-50™kvikpen®100-me_ml-5-shpricz-ruchek-po-3-ml--1024x1024.jpg',
      price: 824.5,
      categore: MedicineCategore.Diabetes,
    ),
    Medicine(
      name: 'Humalog®Mix 25™KwikPen®100 IU/mL, 5',
      description: 'diabetes mellitus requiring insulin therapy.',
      imageUrl:
          'images/diabetes/✔humalog®miks-25™kvikpen®100-me_ml-5-shpricz-ruchek-po-3-ml--1024x1024.jpg',
      price: 773,
      categore: MedicineCategore.Diabetes,
    ),
    Medicine(
      name: 'Novomix® 30 FlexPen® 100 IU/mL 5',
      description:
          'Glucose control in patients with type 1 and type 2 diabetes',
      imageUrl:
          'images/diabetes/✔novomix®-30-flexpen®.-100-iu_ml-5-syringe-pens×-3ml--1024x1024.jpg',
      price: 637,
      categore: MedicineCategore.Diabetes,
    ),
    Medicine(
      name: 'On Call Plus Blood Glucose test Strips 50',
      description:
          'Glucose test strips are small, plastic strips that help to test and measure blood glucose levels. Usually, a finger prick is administered and a droplet of blood is placed onto the glucose strip.',
      imageUrl:
          'images/diabetes/on-call-plus-blood-glucose-test-strips-1024x1024.jpg',
      price: 250,
      categore: MedicineCategore.Diabetes,
    ),
    Medicine(
      name: 'Lantus®SoloStar®, 5 pens of 3 ml',
      description:
          'LANTUS is indicated to improve glycemic control in adults and pediatric patients with type 1 diabetes mellitus and in adults with type 2 diabetes mellitus.',
      imageUrl:
          'images/diabetes/✔lantus®solostar®-insulin-glargin-100-ed_ml-5-ruchek-po-3-ml--1024x1024.jpg',
      price: 870,
      categore: MedicineCategore.Diabetes,
    ),
    Medicine(
      name: 'Novomix® 30 FlexPen® 100 IU/mL 5',
      description:
          'Glucose control in patients with type 1 and type 2 diabetes',
      imageUrl:
          'images/diabetes/✔novomix®-30-flexpen®.-100-iu_ml-5-syringe-pens×-3ml--1024x1024.jpg',
      price: 637,
      categore: MedicineCategore.Diabetes,
    ),
    Medicine(
      name: 'NovoNorm 30 tabl',
      description:
          'Type 2 diabetes mellitus (if diet therapy, weight loss and exercise are ineffective)',
      imageUrl: 'images/diabetes/1.jpg',
      price: 500,
      categore: MedicineCategore.Diabetes,
    ),
    Medicine(
      name: 'Apidra® 100 mg/ml ,5 cartridges of 3 ml',
      description:
          'Type 1 diabetesType 2 diabetes Insulin resistance Diabetic ketoacidosis (DKA)',
      imageUrl: 'images/diabetes/2.jpg',
      price: 425,
      categore: MedicineCategore.Diabetes,
    ),
    Medicine(
      name: 'Accu-Check Performa, 50 test strips',
      description: 'Testing your blood sugar',
      imageUrl: 'images/diabetes/3.jpg',
      price: 360,
      categore: MedicineCategore.Diabetes,
    ),
    Medicine(
      name: 'Sweet fitness Stevia 25 sachets',
      description: 'Stevia Zero calorie sweetener',
      imageUrl: 'images/diabetes/4.jpg',
      price: 45,
      categore: MedicineCategore.Diabetes,
    ),
    Medicine(
      name: 'Trajenta 5 mg, 30 tablets',
      description:
          'Trajenta is indicated in adults with type 2 diabetes as an adjunct to diet and exercise to improve glycemic control.',
      imageUrl: 'images/diabetes/5.jpg',
      price: 411,
      categore: MedicineCategore.Diabetes,
    ),
    Medicine(
      name: 'Synjardi 12.5 mg/1000 mg, 60 tablets',
      description:
          'Singiardi is used: - in patients whose diabetes is not sufficiently controlled with metformin alone;',
      imageUrl: 'images/diabetes/6.jpg',
      price: 666,
      categore: MedicineCategore.Diabetes,
    ),
    Medicine(
      name: 'Diet-Sweet Low-calorie sweetener 100 tablets',
      description: 'Diet-Sweet is an alternative artificial sweetener to sugar',
      imageUrl: 'images/diabetes/7.jpg',
      price: 25,
      categore: MedicineCategore.Diabetes,
    ),
    Medicine(
      name: 'Sekem Stevia 100 tablets',
      description:
          'Stevia is an ideal sweetener for diabetic patients as it increases insulin production due to its antioxidant property.',
      imageUrl: 'images/diabetes/8.jpg',
      price: 80,
      categore: MedicineCategore.Diabetes,
    ),
    Medicine(
      name: 'Sweetal 100 tablets',
      description: 'Stevia Zero calorie sweetener',
      imageUrl: 'images/diabetes/9.jpg',
      price: 60,
      categore: MedicineCategore.Diabetes,
    ),
    Medicine(
      name: 'Sweet Fitness 50 sachets of 1,5 g',
      description: 'Stevia Zero calorie sweetener',
      imageUrl: 'images/diabetes/10.jpg',
      price: 75,
      categore: MedicineCategore.Diabetes,
    ),
    Medicine(
      name: 'Trulicity™0.75 mg/0.5',
      description:
          'Trulicity® is indicated in adults with type 2 diabetes to improve glycemic control',
      imageUrl: 'images/diabetes/11.jpg',
      price: 1000,
      categore: MedicineCategore.Diabetes,
    ),
    Medicine(
      name: 'Rybelsus® 14 mg, 10 tablets',
      description:
          'for use in adult patients with poor control of T2DM in addition to diet and exercise to improve glycemic control:',
      imageUrl: 'images/diabetes/12.jpeg',
      price: 1050,
      categore: MedicineCategore.Diabetes,
    ),
    Medicine(
      name: 'Rybelsus® 7 mg, 10 tablets',
      description:
          'for use in adult patients with poor control of T2DM in addition to diet and exercise to improve glycemic control:',
      imageUrl: 'images/diabetes/13.jpg',
      price: 1050,
      categore: MedicineCategore.Diabetes,
    ),
    Medicine(
      name: 'Rybelsus® 3 mg, 10 tablets',
      description:
          'for use in adult patients with poor control of T2DM in addition to diet and exercise to improve glycemic control:',
      imageUrl: 'images/diabetes/14.jpeg',
      price: 1050,
      categore: MedicineCategore.Diabetes,
    ),
    Medicine(
      name: 'Accu-Chek Active 50 test-strips',
      description: 'A device for measuring glucose in the blood.',
      imageUrl: 'images/diabetes/15.jpg',
      price: 600,
      categore: MedicineCategore.Diabetes,
    ),
    Medicine(
      name: 'Sweetal 250 gm',
      description: 'Zero calorie sweetener for baking, food and beverages',
      imageUrl: 'images/diabetes/16.jpg',
      price: 125,
      categore: MedicineCategore.Diabetes,
    ),
    Medicine(
      name: 'Sweetal 50 sachets × 2 gm',
      description: 'Zero calorie sweetener for baking, food and beverages',
      imageUrl: 'images/diabetes/17.jpg',
      price: 75,
      categore: MedicineCategore.Diabetes,
    ),
    Medicine(
      name: 'Sweetal  25 sticks',
      description: 'Zero calorie sweetener for coffee, tea and beverages.',
      imageUrl: 'images/diabetes/18.jpg',
      price: 30,
      categore: MedicineCategore.Diabetes,
    ),
    Medicine(
      name: 'Neuropatex 600 mg',
      description: 'Diabetic neuropathy Peripheral neuritis and optic neuritis',
      imageUrl: 'images/diabetes/19.jpg',
      price: 86,
      categore: MedicineCategore.Diabetes,
    ),
    Medicine(
      name: 'Thiotacid compound 600 mg',
      description:
          'Diabetic polyneuropathy, neuritis, polyneuritis, optic neuritis and encephalopathies.',
      imageUrl: 'images/diabetes/20.jpg',
      price: 162,
      categore: MedicineCategore.Diabetes,
    ),
    Medicine(
      name: 'Icandra 50 mg',
      description:
          'Type 2 diabetes mellitus: as monotherapy in combination with diet and exercise; as part of a two-component combination therapy with metformin,',
      imageUrl: 'images/diabetes/21.jpg',
      price: 88.5,
      categore: MedicineCategore.Diabetes,
    ),
    Medicine(
      name: 'Surgalo Plus 50/1000',
      description:
          'Type 2 diabetes mellitus (in combination with diet therapy and exercise).',
      imageUrl: 'images/diabetes/22.jpg',
      price: 112.5,
      categore: MedicineCategore.Diabetes,
    ),
    Medicine(
      name: 'Sugarlo 50 mg',
      description:
          'Type 2 diabetes mellitus: as monotherapy in combination with diet and exercise; as part of a two-component combination therapy with metformin,',
      imageUrl: 'images/diabetes/23.jpg',
      price: 93,
      categore: MedicineCategore.Diabetes,
    ),
    Medicine(
      name: 'Slimmer sweetener',
      description: 'Zero calorie sweetener ',
      imageUrl: 'images/diabetes/24.jpg',
      price: 62,
      categore: MedicineCategore.Diabetes,
    ),
    Medicine(
      name: 'Sweetal  100 sticks',
      description: 'Zero calorie sweetener for coffee, tea and beverages.',
      imageUrl: 'images/diabetes/25.jpg',
      price: 100,
      categore: MedicineCategore.Diabetes,
    ),
    Medicine(
      name: 'Cidophage 1000 mg',
      description:
          'Diabetes mellitus type 2 (insulin-independent) with the ineffectiveness of diet therapy and exercise,',
      imageUrl: 'images/diabetes/26.jpg',
      price: 37.5,
      categore: MedicineCategore.Diabetes,
    ),
    Medicine(
      name: 'Cidophage 850 mg',
      description:
          'Diabetes mellitus type 2 (insulin-independent) with the ineffectiveness of diet therapy and exercise,',
      imageUrl: 'images/diabetes/27.jpg',
      price: 27,
      categore: MedicineCategore.Diabetes,
    ),
    Medicine(
      name: 'NovoNorm 2 mg, 30 tablets',
      description:
          'Type 2 diabetes mellitus (with the ineffectiveness of diet therapy, weight loss and physical activity)',
      imageUrl: 'images/diabetes/28.jpg',
      price: 44,
      categore: MedicineCategore.Diabetes,
    ),
    Medicine(
      name: 'Mellitofix Met 12.5/500 mg',
      description:
          'Treatment of type 2 diabetes in adults as an adjunct to diet and exercise regimen: – if the use of the maximum tolerated dose of metformin alone is not enough;',
      imageUrl: 'images/diabetes/29.jpg',
      price: 193.5,
      categore: MedicineCategore.Diabetes,
    ),
    Medicine(
      name: 'Mellitofix Met 12,5/1000 mg',
      description:
          'Treatment of type 2 diabetes in adults as an adjunct to diet and exercise regimen: – if the use of the maximum tolerated dose of metformin alone is not enough;',
      imageUrl: 'images/diabetes/30.jpg',
      price: 214.5,
      categore: MedicineCategore.Diabetes,
    ),
    Medicine(
      name: 'Icandra Plus 50/1000 mg',
      description:
          'Type 2 diabetes mellitus (in combination with diet therapy and physical exercises).',
      imageUrl: 'images/diabetes/31.jpg',
      price: 147,
      categore: MedicineCategore.Diabetes,
    ),
    Medicine(
      name: 'Zanoglide 4/30 mg, 30 tablets',
      description:
          'Treatment of type 2 diabetes mellitus: as a second-line drug if diet, exercise and previous therapy with one or two drugs do not provide adequate control of blood sugar levels.',
      imageUrl: 'images/diabetes/32.jpg',
      price: 73.5,
      categore: MedicineCategore.Diabetes,
    ),
    Medicine(
      name: 'Zanoglide 2/30 mg, 30 tablets',
      description:
          'Treatment of type 2 diabetes mellitus: as a second-line drug if diet, exercise and previous therapy with one or two drugs do not provide adequate control of blood sugar levels.',
      imageUrl: 'images/diabetes/33.jpeg',
      price: 67.5,
      categore: MedicineCategore.Diabetes,
    ),
    Medicine(
      name: 'Thiotex forte 600 mg, 20 capsules',
      description:
          'Diabetic polyneuropathy, neuritis, polyneuritis, optic neuritis and encephalopathy.',
      imageUrl: 'images/diabetes/34.jpeg',
      price: 110,
      categore: MedicineCategore.Diabetes,
    ),
    Medicine(
      name: 'Amaglust 30/4 mg, 30 tablets',
      description:
          'Treatment of type 2 diabetes mellitus: as a second-line drug if diet, exercise and previous therapy with one or two drugs do not provide adequate control of blood sugar levels. ',
      imageUrl: 'images/diabetes/35.jpeg',
      price: 73.5,
      categore: MedicineCategore.Diabetes,
    ),
    Medicine(
      name: 'Amaglust 30/2 mg, 30 tablet',
      description:
          'Treatment of type 2 diabetes mellitus: as a second-line drug if diet, exercise and previous therapy with one or two drugs do not provide adequate control of blood sugar levels.',
      imageUrl: 'images/diabetes/36.jpg',
      price: 67.5,
      categore: MedicineCategore.Diabetes,
    ),
    Medicine(
      name: 'Diabenor 3 mg 30 tablets',
      description:
          'treating a certain form of diabetes (type 2 diabetes) where diet, exercise, and weight loss fail to control blood sugar levels.',
      imageUrl: 'images/diabetes/37.jpeg',
      price: 40.5,
      categore: MedicineCategore.Diabetes,
    ),
    Medicine(
      name: 'Maxofage XR 1000 mg 30 tablets',
      description:
          'Type 2 diabetes mellitus, especially in obese patients with diet and exercise failure in adults as monotherapy or in combination with other oral hypoglycemic drugs, or with insulin.',
      imageUrl: 'images/diabetes/38.jpg',
      price: 54,
      categore: MedicineCategore.Diabetes,
    ),
    Medicine(
      name: 'Glucovance 1000/5mg 30 tablets',
      description:
          'Type 2 diabetes mellitus with ineffective diet therapy and previous therapy with sulfonylurea derivatives or biguanides, as well as other oral hypoglycemic agents.',
      imageUrl: 'images/diabetes/39.jpg',
      price: 150,
      categore: MedicineCategore.Diabetes,
    ),
    Medicine(
      name: 'Thiotaside compound 300 mg 30 tablets',
      description:
          'Diabetic polyneuropathy, diabetic retinopathy, neuritis, polyneuritis, neurodegenerative diseases, optic neuritis,',
      imageUrl: 'images/diabetes/40.jpg',
      price: 109.5,
      categore: MedicineCategore.Diabetes,
    ),
    Medicine(
      name: 'Glucovance 500/2.5 mg 30 tablets',
      description:
          'Type 2 diabetes mellitus with the ineffectiveness of diet therapy and previous therapy with sulfonylurea derivatives or biguanides, as well as other oral hypoglycemic agents.',
      imageUrl: 'images/diabetes/41.jpg',
      price: 36,
      categore: MedicineCategore.Diabetes,
    ),
    // hygieneandcosmetics
    Medicine(
      name: "Care & More Tropical Glycerin Soft Cream 75ml",
      description:
          "Care & More Soft cream with Glycerin for hands and body has nice tropical flavor .",
      imageUrl:
          "images/hygieneandcosmetics/88.-hepta-panthenol-hair-cream-100-gm-1024x1024.jpg",
      price: 70,
      categore: MedicineCategore.Hygiene_And_Cosmetics,
    ),
    Medicine(
      name: "Eva Skin Clinic",
      description:
          "Feel the power of Eva Skin Clinic Acne Prone Skin and say goodbye to stubborn breakouts. This advanced skin care product is specially formulated for acne-prone skin, providing effective and long-lasting results.",
      imageUrl:
          "images/hygieneandcosmetics/89.-eva-skin-clinic-acne-prone-skin-correcting-care-cream20-ml.-russkaya-apteka-sharm-el-shejh-dahab-hurgada--1024x1024.png",
      price: 100,
      categore: MedicineCategore.Hygiene_And_Cosmetics,
    ),
    Medicine(
      name: "Vatika Dermoviva Moisture Plus Face Wash 60 ml",
      description:
          "Vatika Dermoviva Almond Moisture Plus face wash is infused with moisture-boosting natural ingredients that cleanse effectively, maintain the pH balance of your skin, and retain critical moisture for energized refreshed skin.",
      imageUrl:
          "images/hygieneandcosmetics/90.-vatika-dermo-viva-face-wash-60-ml-.-russkaya-apteka-sharm-el-shejh-dahab-hurgada--1024x1024.png",
      price: 75,
      categore: MedicineCategore.Hygiene_And_Cosmetics,
    ),
    Medicine(
      name: "Bobana Hand Cream with Wild Roses 50 ml",
      description:
          "Bobana’s Hand Cream is with Hyaluronic Acid which hydrates your skin to the core giving you long lasting deep moisturizing.",
      imageUrl:
          "images/hygieneandcosmetics/91.-bobana-hand-cream-wild-roses-50-ml.-russkaya-apteka-sharm-el-shejh-dahab-hurgada--1024x1024.png",
      price: 80,
      categore: MedicineCategore.Hygiene_And_Cosmetics,
    ),
    Medicine(
      name: "Bio Soft ",
      description:
          "Your hair is damaged and falling out. Get ready for healthy, shiny hair with Bio Soft Coconut Conditioner that softens and hydrates curly hair.",
      imageUrl:
          "images/hygieneandcosmetics/bio-soft-naturalnyj-uvlazhnyayushhij-kondiczioner-s-kokosovym-maslom.-russkaya-apteka-sharm-el-shejh-dahab-hurgada--1024x1024.jpg",
      price: 110,
      categore: MedicineCategore.Hygiene_And_Cosmetics,
    ),
    Medicine(
      name: "Eva Skin Care Natural Glow Lightening Roll On",
      description:
          "Eva Skin Care Natural Glow Lightening Roll On deodorant advanced formula is enriched with multivitamins and natural ingredients ",
      imageUrl:
          "images/hygieneandcosmetics/84.-eva-natural-glow-lightening-roll-on-deodorant-60-gm-1024x1024.jpg",
      price: 110,
      categore: MedicineCategore.Hygiene_And_Cosmetics,
    ),
    Medicine(
      name: "Primrose- E dietary supplement 30 capsules",
      description:
          "Evening primrose oil capsules – a true friend of your beauty and health!",
      imageUrl:
          "images/hygieneandcosmetics/52.-primrose-e-30-capsules-1024x1024.jpg",
      price: 165,
      categore: MedicineCategore.Hygiene_And_Cosmetics,
    ),
    Medicine(
      name: "Eva skin clinic anti-aging collagen ampoules",
      description: "Eva skin clinic anti-aging collagen ampoules",
      imageUrl: "images/hygieneandcosmetics/1.jpg",
      price: 70,
      categore: MedicineCategore.Hygiene_And_Cosmetics,
    ),
    Medicine(
      name: "Care & More Tropical Glycerin Soft Cream 75ml",
      description:
          "Care & More Soft cream with glycerin for hands and body has a pleasant tropical aroma.",
      imageUrl: "images/hygieneandcosmetics/2.png",
      price: 40,
      categore: MedicineCategore.Hygiene_And_Cosmetics,
    ),
    Medicine(
      name: "Selenium Daily Vit. Vitamins ACE and Zinc 30 tablets",
      description:
          "As you age and go through periods of extreme stress, sometimes physically recovering from illness, your nails and hair can become lackluster and dull.",
      imageUrl: "images/hygieneandcosmetics/2.jpg",
      price: 165,
      categore: MedicineCategore.Hygiene_And_Cosmetics,
    ),
    Medicine(
      name: "Bio Soft Argan Oil Natural Moisturizing Conditioner, 250 ml",
      description:
          "The Bio Soft Argan Oil Natural Moisturizing Conditioner is suitable for use on versatile hair types.",
      imageUrl: "images/hygieneandcosmetics/3.png",
      price: 110,
      categore: MedicineCategore.Hygiene_And_Cosmetics,
    ),
    Medicine(
      name: "Vatika Naturals Mink Styling Hair Cream",
      description:
          "The Vatika Naturals mink oil styling cream is enriched with Mink & B5 Vitamin which is known for centuries for their powerful properties.",
      imageUrl: "images/hygieneandcosmetics/4.jpg",
      price: 50,
      categore: MedicineCategore.Hygiene_And_Cosmetics,
    ),
    Medicine(
      name: "Dove Shampoo Intensive Repair, 400 ml",
      description:
          "Whether it’s styling or the effect of the environment we live in, we put our hair through a lot. ",
      imageUrl: "images/hygieneandcosmetics/5.jpg",
      price: 85,
      categore: MedicineCategore.Hygiene_And_Cosmetics,
    ),
    Medicine(
      name: "Dove Intensive Repair Conditioner, 350 ml",
      description:
          "From heat styling to hot weather, our hair goes through a lot.",
      imageUrl: "images/hygieneandcosmetics/6.jpeg",
      price: 90,
      categore: MedicineCategore.Hygiene_And_Cosmetics,
    ),
    Medicine(
      name: "Nivea Men Deodorant Stick Cool Kick, 50 gm",
      description:
          "Nivea Deodorant Stick Cool Kick Long Lasting With its cooling care formula,",
      imageUrl: "images/hygieneandcosmetics/7.jpg",
      price: 195,
      categore: MedicineCategore.Hygiene_And_Cosmetics,
    ),
    Medicine(
      name: "Rexona Women Roll",
      description:
          "Rexona Women Antiperspirant for Women provides 48-hour protection and helps kill odour causing bacteria",
      imageUrl: "images/hygieneandcosmetics/8.jpg",
      price: 80,
      categore: MedicineCategore.Hygiene_And_Cosmetics,
    ),
    Medicine(
      name: "Lady Speed Stick Deodorant for women",
      description:
          "Lady Speed Stick Powder Fresh Deodorant gives all-day odor protection and leaves no residue, to keep you feeling clean and fresh with a wild freesia scent.",
      imageUrl: "images/hygieneandcosmetics/9.jpg",
      price: 200,
      categore: MedicineCategore.Hygiene_And_Cosmetics,
    ),
    Medicine(
      name: "Betadine Gargle & Mouthwash, 120 ml",
      description:
          "Betadine Gargle & Mouthwash is rapidly virucidal, fungicidal and is effective against all streptococcal organisms and may be used in the treatment of streptococcal tonsillitis and sore throat.",
      imageUrl: "images/hygieneandcosmetics/10.jpg",
      price: 60,
      categore: MedicineCategore.Hygiene_And_Cosmetics,
    ),
    Medicine(
      name: "Eva Smokers e-line Mouthwash, 250 ml",
      description:
          "Eva Smokers E-Line Mouthwash cleans beyond just the surfaces of teeth and gums,",
      imageUrl: "images/hygieneandcosmetics/11.jpg",
      price: 90,
      categore: MedicineCategore.Hygiene_And_Cosmetics,
    ),
    Medicine(
      name: "Vebix SUN CARE KIDS 200 ml",
      description:
          "Experience sun protection like never before with Vebix Sun Care Lotion! UVA and UVB filters give excellent sun protection.",
      imageUrl: "images/hygieneandcosmetics/12.jpg",
      price: 320,
      categore: MedicineCategore.Hygiene_And_Cosmetics,
    ),
    Medicine(
      name: "Rota panthenol shampoo 120ml",
      description:
          "Rota Panthenol shampoo helps in coating the hair, sealing its surface, lubricating the shaft,",
      imageUrl: "images/hygieneandcosmetics/13.jpg",
      price: 45,
      categore: MedicineCategore.Hygiene_And_Cosmetics,
    ),
    Medicine(
      name: "Eva Skin Care Natural Glow",
      description:
          "Eva Skin Care Natural Glow Lightening Roll On deodorant advanced formula is enriched with multivitamins and natural ingredients",
      imageUrl: "images/hygieneandcosmetics/14.jpg",
      price: 110,
      categore: MedicineCategore.Hygiene_And_Cosmetics,
    ),
    Medicine(
      name: "Eva Skin Care Natural Glow ",
      description:
          "Eva Skin Care Natural Glow Lightening Roll On deodorant advanced formula is enriched with multivitamins and natural ingredients",
      imageUrl: "images/hygieneandcosmetics/15.jpg",
      price: 110,
      categore: MedicineCategore.Hygiene_And_Cosmetics,
    ),
    Medicine(
      name: "Lotion Zinc and Olive 100 ml",
      description:
          "Healthy skin is one of the most important signs of beauty that requires special care to maintain it, and with Zinc Olive Lotion, rich in zinc oxide for antioxidant benefits, taking care of your skin becomes easier.",
      imageUrl: "images/hygieneandcosmetics/16.jpg",
      price: 48,
      categore: MedicineCategore.Hygiene_And_Cosmetics,
    ),
    Medicine(
      name: "Garnier Day Cream Fast Bright",
      description:
          "Fast Fairness Day Cream is fortified with 3x Vitamin C and Lemon, known to visibly reduce dark spots and brighten skin. ",
      imageUrl: "images/hygieneandcosmetics/17.jpg",
      price: 60,
      categore: MedicineCategore.Hygiene_And_Cosmetics,
    ),
    Medicine(
      name: "Imtenan Dead Sea Soap Deep Cleansing 100 gm",
      description: "100% Natural Handmade Dead Sea Soap from Imtenan.",
      imageUrl: "images/hygieneandcosmetics/18.jpg",
      price: 80,
      categore: MedicineCategore.Hygiene_And_Cosmetics,
    ),
    Medicine(
      name: "mtenan Oat Honey Soap 100 gm",
      description: "100% Natural Handmade Oat Honey Soap from Imtenan. ",
      imageUrl: "images/hygieneandcosmetics/19.jpg",
      price: 80,
      categore: MedicineCategore.Hygiene_And_Cosmetics,
    ),
    Medicine(
      name: "Imtenan Unscented Glycerin Soap 100gm",
      description:
          "Unscented Moisturized Glycerin soap (100% Natural) from Imtenan is considered the ideal moisturizer for all skin types.",
      imageUrl: "images/hygieneandcosmetics/20.jpg",
      price: 80,
      categore: MedicineCategore.Hygiene_And_Cosmetics,
    ),

    Medicine(
      name: "Garnier Day Cream Fast Bright",
      description:
          "Fast Fairness Day Cream is fortified with 3x Vitamin C and Lemon, known to visibly reduce dark spots and brighten skin.",
      imageUrl: "images/hygieneandcosmetics/21.jpg",
      price: 165,
      categore: MedicineCategore.Hygiene_And_Cosmetics,
    ),
    Medicine(
      name: "Garnier Fast bright Vitamin C & Lemon Face Wash 50 ml",
      description:
          "Get rid of dirt, dust, and impurities from the skin with the deep cleansing Garnier vitamin C face wash.",
      imageUrl: "images/hygieneandcosmetics/22.jpg",
      price: 60,
      categore: MedicineCategore.Hygiene_And_Cosmetics,
    ),
    Medicine(
      name: "Garnier Anti-dark spot serum Vitamin C 30 ml",
      description:
          "Garnier’s Vitamin C pairs super citrus extracts with Vitamin C, a powerful anti-oxidant,",
      imageUrl: "images/hygieneandcosmetics/23.jpg",
      price: 285,
      categore: MedicineCategore.Hygiene_And_Cosmetics,
    ),
    Medicine(
      name: "Garnier Oil-Infused Micellar Water 100 ml",
      description:
          "The Garnier Oil-Infused Micellar Water wipes away heavy, stubborn makeup, dust, and dirt from your skin with ease.",
      imageUrl: "images/hygieneandcosmetics/24.jpg",
      price: 110,
      categore: MedicineCategore.Hygiene_And_Cosmetics,
    ),
    Medicine(
      name: "Garnier  Vitamin C Micellar Water 400 ml",
      description:
          "Garnier Micellar Cleansing Water gently removes up to 100% make-up and intensely cleanses skin of dirt, oil, SPF, pollution & dead skin cells – all in one step.",
      imageUrl: "images/hygieneandcosmetics/25.jpg",
      price: 250,
      categore: MedicineCategore.Hygiene_And_Cosmetics,
    ),
    Medicine(
      name: "Garnier Vitamin C Micellar Water 100 ml",
      description:
          "Garnier Micellar Cleansing Water gently removes up to 100% of makeup and intensely cleanses skin of dirt, oil, SPF, impurities and dead cells - all in one step.",
      imageUrl: "images/hygieneandcosmetics/26.jpg",
      price: 110,
      categore: MedicineCategore.Hygiene_And_Cosmetics,
    ),
    Medicine(
      name: "Bobana  Coconut Oil Leave-in Cream 200 ml",
      description:
          "Want smoother, shinier, and stronger hair every day? The Bobana Leave-In Cream is here to save your day.",
      imageUrl: "images/hygieneandcosmetics/27.jpg",
      price: 125,
      categore: MedicineCategore.Hygiene_And_Cosmetics,
    ),
    Medicine(
      name: "Bobana Black Garlic Leave-in Cream 200ml",
      description:
          "The Bobana Black Garlic Oil Leave-in Cream is a dream come true for weak, frizzy hair!",
      imageUrl: "images/hygieneandcosmetics/28.jpg",
      price: 125,
      categore: MedicineCategore.Hygiene_And_Cosmetics,
    ),
    Medicine(
      name: "Bobana Leave-in Cream With Argan Oil 200 ml",
      description:
          "Bobana’s luscious, creamy Argan Oil Leave In Cream nourishes distressed locks and eliminates frizz.",
      imageUrl: "images/hygieneandcosmetics/29.jpg",
      price: 125,
      categore: MedicineCategore.Hygiene_And_Cosmetics,
    ),
    Medicine(
      name: "Trichup Aloe Vera Hydrating gel for all skin types",
      description:
          "Trichup Aloe Vera gel formulated using purest form of Aloe Vera, Trichup Aloe Vera Gel delivers a soothing and cooling effect, making skin smooth, soft and moisturized. Ideal for after-sun skin care.",
      imageUrl: "images/hygieneandcosmetics/30.jpg",
      price: 135,
      categore: MedicineCategore.Hygiene_And_Cosmetics,
    ),
    // painRelieversAndAntiInflammatories
    Medicine(
      name: "Mafo syrup 100 mg/5 ml",
      description:
          "Pain syndrome of various origins of mild and moderate intensity in: toothache, painful teething; earache with inflammation of the middle ear;",
      imageUrl:
          "images/Painrelieversandanti/✔mafo-sirop-100-mg_5-ml100-ml--1024x1024.jpg",
      price: 15,
      categore: MedicineCategore.PainRelievers_And_AntiInflammatories,
    ),
    Medicine(
      name: "Migriza 10 mg , 5 tablets",
      description:
          "Migriza is used to treat the headache phase of the migraine attack in adults.",
      imageUrl:
          "images/Painrelieversandanti/✔migriza-10-mg5-tabletok--1024x1024.jpg",
      price: 30,
      categore: MedicineCategore.PainRelievers_And_AntiInflammatories,
    ),
    Medicine(
      name: "Flamotal 400 mg, 30 tablets",
      description:
          "Ankylosing spondylitis and other inflammatory diseases of the spine;",
      imageUrl:
          "images/Painrelieversandanti/✔flamotal-400-mg-30-tabletok-1024x1024.jpg",
      price: 24,
      categore: MedicineCategore.PainRelievers_And_AntiInflammatories,
    ),
    Medicine(
      name: "Megalase Bacterial ",
      description:
          "Treatment and prevention of edema in a number of situations. Adjuvant antibiotic therapy.",
      imageUrl: "images/Painrelieversandanti/✔megalejz-tab-1024x1024.jpg",
      price: 46.5,
      categore: MedicineCategore.PainRelievers_And_AntiInflammatories,
    ),
    Medicine(
      name: "Stopadol 650 mg, 30 tablets",
      description:
          "Effective in relieving persistent pain associated with osteoarthritis, muscle pain and pain such as back pain.",
      imageUrl:
          "images/Painrelieversandanti/✔stopadol-650-mg-30-tabletok-prolongirovannogo-vysvobozhdeniya-1024x1024.jpg",
      price: 51,
      categore: MedicineCategore.PainRelievers_And_AntiInflammatories,
    ),
    Medicine(
      name: "Pridocaine cream, 15 g",
      description:
          "Local anesthetic for topical use to produce surface anesthesia of the skin for ",
      imageUrl: "images/painrelieversandanti/1.jpg",
      price: 21.5,
      categore: MedicineCategore.PainRelievers_And_AntiInflammatories,
    ),
    Medicine(
      name: "Ambezim-G 30 tabs",
      description:
          "Resorption of post-traumatic and post-operative oedema, exudate.",
      imageUrl: "images/painrelieversandanti/2.jpg",
      price: 64.5,
      categore: MedicineCategore.PainRelievers_And_AntiInflammatories,
    ),
    Medicine(
      name: "Stopadol Night 30 tablets",
      description: "For the short-term treatment of back pain",
      imageUrl: "images/painrelieversandanti/3.jpg",
      price: 32.25,
      categore: MedicineCategore.PainRelievers_And_AntiInflammatories,
    ),
    Medicine(
      name: "Plaquenil 200 mg, 60 tablets",
      description:
          "Rheumatoid arthritis (inflammation of the joints) Juvenile idiopathic arthritis (inflammation of the joints)",
      imageUrl: "images/painrelieversandanti/4.jpg",
      price: 120,
      categore: MedicineCategore.PainRelievers_And_AntiInflammatories,
    ),
    Medicine(
      name: "No-Migrain 30 tablets",
      description: "Abortive and/ or preventive therapy for vascular headache.",
      imageUrl: "images/painrelieversandanti/5.jpg",
      price: 30,
      categore: MedicineCategore.PainRelievers_And_AntiInflammatories,
    ),
    Medicine(
      name: "Megalase 200 U.CEIP/ ml Syrup",
      description: "Otorhinolaryngology Rhinoplasty, tonsillectomy",
      imageUrl: "images/painrelieversandanti/6.jpg",
      price: 19.5,
      categore: MedicineCategore.PainRelievers_And_AntiInflammatories,
    ),
    Medicine(
      name: "Lotus ointment with colocynth 150 gr",
      description: "Relieves pain in knees, lower back, shoulders.",
      imageUrl: "images/painrelieversandanti/6-.jpg",
      price: 250,
      categore: MedicineCategore.PainRelievers_And_AntiInflammatories,
    ),
    Medicine(
      name: "Limitless Allzyme Max",
      description:
          "Swelling and blood clots after an injury or surgery Infections of the throat, pharynx, larynx, ear and sinuses Lung and bronchial infections",
      imageUrl: "images/painrelieversandanti/7.jpg",
      price: 112,
      categore: MedicineCategore.PainRelievers_And_AntiInflammatories,
    ),
    Medicine(
      name: "Solpadol 2.5 mg, 6 tablets",
      description:
          "Тreatment of acute migraine with or without aura in adults.",
      imageUrl: "images/painrelieversandanti/8.jpg",
      price: 60,
      categore: MedicineCategore.PainRelievers_And_AntiInflammatories,
    ),
    Medicine(
      name: "Unicetamol drops",
      description:
          "Pain syndrome of mild and moderate intensity of various origins",
      imageUrl: "images/painrelieversandanti/9.jpeg",
      price: 9.5,
      categore: MedicineCategore.PainRelievers_And_AntiInflammatories,
    ),
    Medicine(
      name: "Spascolon 100 mg 30 tablets",
      description:
          "Symptomatic treatment of pain syndrome with gastrointestinal dyskinesia,",
      imageUrl: "images/painrelieversandanti/10.jpg",
      price: 70.5,
      categore: MedicineCategore.PainRelievers_And_AntiInflammatories,
    ),
    Medicine(
      name: "Recoxibright 90 mg 30 tablets",
      description:
          "treatment of chronic pain in the lower back; – symptomatic therapy of osteoarthritis, rheumatoid arthritis, ankylosing",
      imageUrl: "images/painrelieversandanti/11.jpg",
      price: 204,
      categore: MedicineCategore.PainRelievers_And_AntiInflammatories,
    ),
    Medicine(
      name: "Fewmig 20 capsules",
      description:
          "A traditional herbal remedy used for the prevention of migraine headaches,",
      imageUrl: "images/painrelieversandanti/12.jpg",
      price: 30,
      categore: MedicineCategore.PainRelievers_And_AntiInflammatories,
    ),
    Medicine(
      name: "Ketolgin SR 200 mg 10 capsules",
      description:
          "Treatment of rheumatoid arthritis, osteoarthritis, ankylosing sponditis, acute joint and periarticular disorders, low back pain, muscle pain and dysmenorrhea.",
      imageUrl: "images/painrelieversandanti/13.jpg",
      price: 17,
      categore: MedicineCategore.PainRelievers_And_AntiInflammatories,
    ),
    Medicine(
      name: "Brufen 600 mg 20 sachets",
      description:
          "treatment of rheumatoid arthritis, periarticular diseases such as frozen shoulder (capsulitis), bursitis, tendonitis, tenosynovitis, lower back pain.",
      imageUrl: "images/painrelieversandanti/14.jpg",
      price: 80,
      categore: MedicineCategore.PainRelievers_And_AntiInflammatories,
    ),
    Medicine(
      name: "Hydroquine 200 mg 20 tablets",
      description: "Antimalarial drug.",
      imageUrl: "images/painrelieversandanti/15.jpg",
      price: 40,
      categore: MedicineCategore.PainRelievers_And_AntiInflammatories,
    ),
    Medicine(
      name: "After Meals 20 capsules",
      description: "Dietary supplement that aids digestion.",
      imageUrl: "images/painrelieversandanti/16.jpg",
      price: 50,
      categore: MedicineCategore.PainRelievers_And_AntiInflammatories,
    ),
    Medicine(
      name: "Anticox II 15 mg 30 tablets",
      description:
          "It has anti-inflammatory, analgesic and antipyretic effects. Symptomatic treatment: degenerative joint diseases, incl.",
      imageUrl: "images/painrelieversandanti/17.jpg",
      price: 73.5,
      categore: MedicineCategore.PainRelievers_And_AntiInflammatories,
    ),
    Medicine(
      name: "Fam 10 mg 20 tablets",
      description:
          "It has a pronounced analgesic effect, also has an anti-inflammatory and moderate antipyretic effect.",
      imageUrl: "images/painrelieversandanti/18.jpg",
      price: 21,
      categore: MedicineCategore.PainRelievers_And_AntiInflammatories,
    ),
    //// baby food
    Medicine(
      name: "Nestle Cerelac wheat and apple without Milk",
      description:
          "Cerelac instant cereals include a range of nutritious, easily-digested instant cereals.",
      imageUrl: "images/babyfood/1.jpg",
      price: 30,
      categore: MedicineCategore.Baby_food,
    ),
    Medicine(
      name: "Hero Baby Nutrasense 1",
      description:
          "The unique formula with milk fat developed thanks to over 80 years of research to ensure your baby has a good start in life.",
      imageUrl: "images/babyfood/2.jpg",
      price: 169,
      categore: MedicineCategore.Baby_food,
    ),
    Medicine(
      name: "Hero Baby FEH",
      description:
          "Hero Baby FEH is specially formulated for dietary management of infants with cow’s milk allergy and associated symptoms.",
      imageUrl: "images/babyfood/3.jpg",
      price: 231,
      categore: MedicineCategore.Baby_food,
    ),
    Medicine(
      name: "Hero Baby Digest",
      description:
          "Hero Baby Digest is specially designed to provide more comfort for your baby when experiencing colic or constipation.",
      imageUrl: "images/babyfood/4.jpg",
      price: 209,
      categore: MedicineCategore.Baby_food,
    ),
    Medicine(
      name: "Hero Baby AR",
      description:
          "Hero Baby AR is specially formulated to relieve your baby when suffers recurrent regurgitation and finds it difficult to keep the formula in his stomach.",
      imageUrl: "images/babyfood/5.jpg",
      price: 154,
      categore: MedicineCategore.Baby_food,
    ),
    Medicine(
      name: "Cerelac Nestle wheat no milk 250 gm",
      description:
          "The Nestle Cerelac Wheat is a nutrient-filled meal that keeps your little one full",
      imageUrl: "images/babyfood/6.jpg",
      price: 32,
      categore: MedicineCategore.Baby_food,
    ),
    Medicine(
      name: "Pediasure complete chocolate flavor",
      description:
          "Clinically proven to help kids grow, PediaSure is a delicious nutrition drink that complements a diet for kids who are behind in growth and is available in 4 delicious flavors.",
      imageUrl: "images/babyfood/7.jpg",
      price: 280,
      categore: MedicineCategore.Baby_food,
    ),
    Medicine(
      name: "Hero Baby Nutrasense 3",
      description: "Growing up formula from 1 to 3 years.",
      imageUrl: "images/babyfood/8.jpg",
      price: 154,
      categore: MedicineCategore.Baby_food,
    ),
    Medicine(
      name: "Hero Baby lactose-free infant formula",
      description:
          "Hero Baby LF is specially formulated to relieve your baby when suffers from lactose intolerance and associated diarrhea.",
      imageUrl: "images/babyfood/9.jpg",
      price: 179,
      categore: MedicineCategore.Baby_food,
    ),
    Medicine(
      name: "Similac Ensure Vanilla 400g",
      description:
          "Nutrient Blend Vanilla Flavored – children from 3 years old and adults",
      imageUrl: "images/babyfood/10.jpg",
      price: 165.5,
      categore: MedicineCategore.Baby_food,
    ),
    Medicine(
      name: "Nactalia stage 2 (6-12 months)",
      description:
          "Nactalia offers trusted infant milk formulas that bring your child all the nutrients he needs to grow well, full of life and energy, respecting his natural needs.",
      imageUrl: "images/babyfood/11.jpg",
      price: 110,
      categore: MedicineCategore.Baby_food,
    ),
    Medicine(
      name: "Nactalia stage 1 (0-6 months)",
      description:
          "Nactalia offers trusted infant milk formulas that bring your child all the nutrients he needs to grow well, full of life and energy, respecting his natural needs.",
      imageUrl: "images/babyfood/12.jpg",
      price: 110,
      categore: MedicineCategore.Baby_food,
    ),
    Medicine(
      name: "Nestle Cerelac puree banana orange biscuit",
      description:
          "Cerelac fruit purees are nutritious and delicious baby food that help introduce your little one to the goodness of Fruits from 6 months.",
      imageUrl: "images/babyfood/13.jpg",
      price: 21,
      categore: MedicineCategore.Baby_food,
    ),
    Medicine(
      name: "Nestle Cerelac fruit puree carrot-apple-mango",
      description:
          "Cerelac fruit purees are nutritious and delicious baby food that help introduce your little one to the goodness of Fruits from 6 months. ",
      imageUrl: "images/babyfood/14.jpg",
      price: 21,
      categore: MedicineCategore.Baby_food,
    ),
    Medicine(
      name: "Nestle PreNAN",
      description:
          "The dietary management of infants with low birth weight or preterm infants",
      imageUrl: "images/babyfood/15.jpg",
      price: 105,
      categore: MedicineCategore.Baby_food,
    ),
    //Eye health
    Medicine(
      name: "Orchadexoline Sterile eye solution 5 ml",
      description:
          "Orchadexoline is used in case of inflammation of the front part of the eye, when the inflammation is bacterial or susceptible to bacterial infection.",
      imageUrl: "images/eyehealth/1.jpg",
      price: 17.5,
      categore: MedicineCategore.Eye_health,
    ),
    Medicine(
      name: "DuoTrav Eye Drops 2.5 ml",
      description:
          "DuoTrav Eye Drops are used to lower pressure in the eye and to treat glaucoma.",
      imageUrl: "images/eyehealth/2.jpg",
      price: 120,
      categore: MedicineCategore.Eye_health,
    ),
    Medicine(
      name: "Dexatrol Eye Ointment 5 g",
      description:
          "Conjunctivitis, keratitis, blepharoconjunctivitis, keratoconjunctivitis, corneal ulcers, nonpurulent blepharitis, scleritis, episcleritis and sclera conjunctivitis.",
      imageUrl: "images/eyehealth/3.jpg",
      price: 20,
      categore: MedicineCategore.Eye_health,
    ),
    Medicine(
      name: "Dexatobrin® Sterile eye ointment  5 g",
      description:
          "Dexatobrin® is used to treat inflammatory conditions of the eye where there is or may also be an eye infection.",
      imageUrl: "images/eyehealth/4.jpg",
      price: 26,
      categore: MedicineCategore.Eye_health,
    ),
    Medicine(
      name: "Beta Carotene Forte Vitamin A 25000 IU, 20 caps",
      description:
          "For reducing severe eye strains For night blindness and xerophthalmia For skin sensitivity to sunlight",
      imageUrl: "images/eyehealth/5.jpg",
      price: 29,
      categore: MedicineCategore.Eye_health,
    ),
    Medicine(
      name: "Fortymox Plus. eye drops, 5 ml",
      description:
          "Treatment of ocular infections caused by susceptible microorganisms and prevention of inflammation and bacterial   infection that may occur after ocular surgery.",
      imageUrl: "images/eyehealth/6.jpg",
      price: 26,
      categore: MedicineCategore.Eye_health,
    ),
    Medicine(
      name: "TOBRADEX®Ophthalmic Ointment, 3.5 g",
      description:
          "TOBRADEX® is used to treat inflammatory eye diseases in which there is or may be an eye infection.",
      imageUrl: "images/eyehealth/7.jpg",
      price: 42.5,
      categore: MedicineCategore.Eye_health,
    ),
    Medicine(
      name: "Fluca 0.1%/2% eye drops, 5 ml",
      description: "Eye inflammation and irritation caused by allergies.",
      imageUrl: "images/eyehealth/8.jpg",
      price: 45.5,
      categore: MedicineCategore.Eye_health,
    ),
    Medicine(
      name: "Optidex- T 5 ml",
      description:
          "For the treatment of steroid responsive conditions of the eye when prophylactic antibiotic treatment is also required, after excluding the presence of fungal and viral diseases.",
      imageUrl: "images/eyehealth/9.jpg",
      price: 33.5,
      categore: MedicineCategore.Eye_health,
    ),
    Medicine(
      name: "Co-Avazir, Eye drops,10 ml",
      description: "Prevention of postoperative infections; Blepharitis;",
      imageUrl: "images/eyehealth/10.jpg",
      price: 29,
      categore: MedicineCategore.Eye_health,
    ),
    Medicine(
      name: "Betoptic®0.5 % , eye drops 5 ml",
      description:
          "It is used to treat glaucoma or ocular hypertension (high pressure in the eye).",
      imageUrl: "images/eyehealth/11.jpg",
      price: 23.5,
      categore: MedicineCategore.Eye_health,
    ),
    Medicine(
      name: "Benox 0.4% Eye drops,10 ml",
      description:
          "Local anesthesia in ophthalmology (including superficial anesthesia of the cornea and conjunctiva)",
      imageUrl: "images/eyehealth/12.jpg",
      price: 15,
      categore: MedicineCategore.Eye_health,
    ),
  ];

  List<Medicine> get menu => _menu;
  // List<CartItem> get cart => _cart;

/*
OPerations
*/

  // ignore: non_constant_identifier_names
//   String CardeReceipt() {
//     final receipt = StringBuffer();
//     receipt.writeln("Here is your receipt");
//     receipt.writeln();

//     String fromattedDate =
//         DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

//     receipt.writeln(fromattedDate);
//     receipt.writeln();
//     receipt.writeln("----------------------");

//     for (final cartItem in _cart) {
//       receipt.writeln(
//           "${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}");
//       receipt.writeln();
//     }
//     receipt.writeln("-------------------");
//     receipt.writeln();
//     receipt.writeln("Total Items: ${getTotalItemCount()}");
//     receipt.writeln("Total Price: ${_formatPrice(getTotalPrice())}");

//     return receipt.toString();
//   }

  String _formatPrice(double price) {
    return "\$${price.toStringAsFixed(2)}";
  }

  // Function to search for Medicine items by name
  List<Medicine> searchMedicine(String query) {
    // Convert the query to lowercase for case-insensitive search
    final String queryLower = query.toLowerCase();

    // Filter the _menu list based on whether the name contains the query
    return _menu
        .where((medicine) => medicine.name.toLowerCase().contains(queryLower))
        .toList();
  }
}
