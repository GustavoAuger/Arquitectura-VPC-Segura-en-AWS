# 🛠️ Arquitectura de Red Segmentada en AWS con Terraform

Este proyecto define una infraestructura de red segmentada en AWS utilizando Terraform y una estructura modular. Está diseñado para ejecutarse en la **capa gratuita de AWS**.
Puedes hacer un clone de este proyecto y ejecutarlo en tu cuenta de AWS.
Los pasos para ejecutarlo son los siguientes:

1. Clonar el repositorio
2. Crear un archivo terraform.tfvars o secrets.auto.tfvars con las variables necesarias
3. Ejecutar terraform init
4. Ejecutar terraform apply

A continuación se muestra la estructura del proyecto y las variables necesarias para ejecutarlo.
---

## 📦 ¿Qué crea esta infraestructura?

- VPC con CIDR personalizado
- Subnet pública y privada
- Internet Gateway
- NAT Gateway con Elastic IP
- Tablas de rutas públicas y privadas
- Security Groups para acceso seguro
- Dos instancias EC2:
  - EC2 pública accesible por SSH desde tu IP
  - EC2 privada accesible solo desde la pública (bastion host)
- Outputs de IPs, IDs de recursos y más

---

## 📁 Estructura del Proyecto

```
modules/
├── igw/
│   ├── main.tf
│   ├── outputs.tf
│   └── variables.tf
├── routes/
│   ├── main.tf
│   ├── outputs.tf
│   └── variables.tf
├── security_group/
│   ├── main.tf
│   ├── outputs.tf
│   └── variables.tf
├── subnet/
│   ├── main.tf
│   ├── outputs.tf
│   └── variables.tf
├── vpc/
│   ├── main.tf
│   ├── outputs.tf
│   └── variables.tf
└── ec2/
    ├── main.tf
    ├── outputs.tf
    └── variables.tf
```

---

## ⚙️ Variables necesarias

Estas se definen en `variables.tf`, y algunas se pasan vía `terraform.tfvars` o `secrets.auto.tfvars`.

```hcl
vpc_cidr_block       = "10.0.0.0/16"
public_subnet_cidr   = "10.0.1.0/24"
private_subnet_cidr  = "10.0.2.0/24"
aws_region           = "us-east-1"
aws_availability_zone = "us-east-1a"
key_name             = "FINAL" (nombre de la clave SSH)

```

## 🔐 Seguridad y archivo oculto

Para evitar exponer tu IP pública, define la variable my_ip_cidr en un archivo local que no se sube a GitHub:

secrets.auto.tfvars
my_ip_cidr = "tu_ip/32" (tu ip pública)

## ⚠️ Asegúrate de incluirlo en .gitignore:

*.auto.tfvars
*.tfstate
*.tfstate.backup
.terraform/

## 🧱 Requisitos

Terraform >= 1.3
Cuenta de AWS (capa gratuita)
Un par de claves SSH existente en AWS EC2 (key_name)

## 🚀 Comandos útiles

terraform init     # Inicializar el proyecto
terraform plan     # Ver el plan de ejecución
terraform apply    # Aplicar cambios
terraform destroy  # Destruir infraestructura

## 🧪 Validación

Conexión SSH a la instancia pública:

bash
ssh -i FINAL.pem ec2-user@<ip-publica>

Desde ahí, conexión a la instancia privada:

bash
ssh -i FINAL.pem ec2-user@<ip-privada>

Prueba de conectividad a internet desde la privada:

bash
ssh -i FINAL.pem ec2-user@<ip-privada>

Prueba de conectividad a internet desde la privada:

bash
ssh -i FINAL.pem ec2-user@<ip-privada>

Prueba de conectividad a internet desde la privada:

bash
curl https://www.google.com

## ✍️ Autor

Gustavo Auger Gac
Agosto 2025