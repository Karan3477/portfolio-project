# Frontend Setup for Deployment

## 🔧 Update Services to Use Environment Variables

To make your portfolio ready for deployment, you need to update your services to use the environment API URL instead of hardcoded localhost URLs.

### 1. Update Personal Info Service

```typescript
// frontend/portfolio-app/src/app/services/personal-info.service.ts
import { environment } from '../../environments/environment';

@Injectable({
  providedIn: 'root'
})
export class PersonalInfoService {
  private apiUrl = environment.apiUrl + '/personal-info';
  // ... rest of service remains the same
}
```

### 2. Update Skill Service

```typescript
// frontend/portfolio-app/src/app/services/skill.service.ts
import { environment } from '../../environments/environment';

@Injectable({
  providedIn: 'root'
})
export class SkillService {
  private apiUrl = environment.apiUrl + '/skills';
  // ... rest of service remains the same
}
```

### 3. Update Project Service

```typescript
// frontend/portfolio-app/src/app/services/project.service.ts
import { environment } from '../../environments/environment';

@Injectable({
  providedIn: 'root'
})
export class ProjectService {
  private apiUrl = environment.apiUrl + '/projects';
  // ... rest of service remains the same
}
```

### 4. Update Contact Service

```typescript
// frontend/portfolio-app/src/app/services/contact.service.ts
import { environment } from '../../environments/environment';

@Injectable({
  providedIn: 'root'
})
export class ContactService {
  private apiUrl = environment.apiUrl + '/contact';
  // ... rest of service remains the same
}
```

### 5. Update Contact Message Service

```typescript
// frontend/portfolio-app/src/app/services/contact-info.service.ts
import { environment } from '../../environments/environment';

@Injectable({
  providedIn: 'root'
})
export class ContactInfoService {
  private apiUrl = environment.apiUrl + '/contact-messages';
  // ... rest of service remains the same
}
```

### 6. Update About Service

```typescript
// frontend/portfolio-app/src/app/services/about.service.ts
import { environment } from '../../environments/environment';

@Injectable({
  providedIn: 'root'
})
export class AboutService {
  private apiUrl = environment.apiUrl + '/about';
  // ... rest of service remains the same
}
```

## 🚀 Quick Deployment Steps

1. **Update all services** (as shown above)
2. **Run the deployment script**: `./deploy.sh`
3. **Push to GitHub**: `git add . && git commit -m "Ready for deployment" && git push`
4. **Deploy to Railway**: Follow the deploy-guide.md
5. **Deploy to Netlify**: Follow the deploy-guide.md
6. **Update environment.prod.ts** with your Railway URL

## ✅ Benefits

- **Environment-specific URLs**: Different URLs for development and production
- **Easy deployment**: No code changes needed between environments
- **Maintainable**: Centralized configuration
- **Secure**: No hardcoded URLs in production

## 🔄 After Deployment

Once deployed, your portfolio will:
- Use Railway backend in production
- Use localhost backend in development
- Automatically switch based on environment
- Work seamlessly across all environments 