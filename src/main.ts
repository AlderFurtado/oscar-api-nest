import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);

  // The ThrottlerGuard is registered globally in AppModule via APP_GUARD.
  await app.listen(process.env.PORT ?? 3000);
}

bootstrap();
