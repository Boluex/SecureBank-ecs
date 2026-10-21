# securebank-ecs infrastructure

Terraform roots: `terraform`.

Run `make fmt` and `make validate`. Validation initializes providers with the remote backend disabled and does not deploy resources.

Local emulation roots expose `use_local_emulator`, `ec2_endpoint` and `aws_endpoint`. The existing Ministack defaults are EC2 on port 5003 and other APIs on port 4566. Emulator coverage varies; a successful validate does not prove ECS or load-balancer execution. For AWS, set `use_local_emulator=false` where available and use the normal AWS credential chain.

Keep real tfvars and state out of Git. Configure and initialize a remote backend before shared AWS use. Review a saved plan before applying. Existing resource addresses are preserved; inspect replacement actions before changing networks or databases.

Cloud plans need your image references, region, network settings and any required secrets. Existing environment tfvars on this workstation are not published. Application repositories and Kubernetes manifests are separate from this infrastructure.

## Application configuration

Set `app_config_secret_arn` to an existing Secrets Manager JSON secret containing `encryption_key` (Fernet), `private_key_pem` and `public_key_pem` (RSA). These values are injected into the backend at runtime; images never contain keys. The backend accepts the existing DATABASE_URL or the DB_HOST/DB_PORT/DB_NAME/DB_USER/DB_PASSWORD variables already supplied by ECS. Publish the updated application image before using these settings. Leaving the secret ARN unset supports infrastructure-only validation, but the app will not start without its required keys.

Build the frontend with `--build-arg VITE_API_URL=` for same-origin ALB routing, or supply its public backend origin. Vite configuration is set at build time. The manual image workflow checks out a specified ref from Boluex/SecureBank. Normal pushes run validation only; cloud actions require explicit dispatch and AWS configuration.
