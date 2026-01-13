# 🚀 Cyber-UI Development Environment

## 📋 Proje Hakkında

Bu proje, **FlashUI-Cyber** adlı modern bir React + Vite + TypeScript uygulamasıdır. Google Gemini AI entegrasyonu ile güçlendirilmiş, siber temalı bir kullanıcı arayüzü sunar.

## 🏗️ Mimari Yapı

```
Cyber-UI/
├── components/          # React bileşenleri
│   ├── SideDrawer.tsx
│   ├── Icons.tsx
│   ├── DottedGlowBackground.tsx
│   └── ArtifactCard.tsx
├── index.tsx           # Ana uygulama
├── types.ts            # TypeScript tip tanımlamaları
├── constants.ts        # Sabitler
├── utils.ts            # Yardımcı fonksiyonlar
└── vite.config.ts      # Vite yapılandırması
```

## 🔧 Teknoloji Stack

- **Frontend Framework**: React 19
- **Build Tool**: Vite 6.2
- **Language**: TypeScript 5.8
- **AI Integration**: Google Gemini (@google/genai)
- **Styling**: Custom CSS with Cyber Theme

## 📦 Kurulum ve Çalıştırma

### Otomatik Kurulum (Önerilen)

Tüm bağımlılıkları otomatik yükle ve dev server'ı başlat:

```bash
npm install && npm run dev
```

### Manuel Kurulum

1. **Bağımlılıkları yükle:**
   ```bash
   npm install
   ```

2. **Environment değişkenlerini ayarla:**

   `.env.local` dosyası oluştur ve Gemini API anahtarını ekle:
   ```bash
   echo "GEMINI_API_KEY=your_api_key_here" > .env.local
   ```

3. **Development server'ı başlat:**
   ```bash
   npm run dev
   ```

## 🖥️ Çoklu Terminal Modu

### Senaryo 1: Paralel Development

Aşağıdaki komutu çalıştırarak 3 terminal işlemini aynı anda başlat:

```bash
# Terminal 1: Development Server
npm run dev &

# Terminal 2: Type Checking (Watch Mode)
npx tsc --noEmit --watch &

# Terminal 3: Build Preview
npm run build && npm run preview &
```

### Senaryo 2: Concurrently ile Otomatik Yönetim

**İlk olarak concurrently paketini yükle:**

```bash
npm install --save-dev concurrently
```

**package.json'a yeni scriptler ekle:**

```json
{
  "scripts": {
    "dev": "vite",
    "build": "vite build",
    "preview": "vite preview",
    "dev:full": "concurrently \"npm run dev\" \"npx tsc --noEmit --watch\" \"npm run dev:monitor\"",
    "dev:monitor": "echo '🎯 Monitoring mode active...'",
    "start:all": "npm install && concurrently -n \"DEV,TYPE,BUILD\" -c \"bgBlue,bgMagenta,bgGreen\" \"npm run dev\" \"npx tsc --noEmit --watch\" \"echo '✅ All systems operational'\""
  }
}
```

**Çalıştırma:**

```bash
npm run start:all
```

Bu komut şunları yapar:
- 🔵 **Terminal 1 (DEV)**: Vite development server (Port 5173)
- 🟣 **Terminal 2 (TYPE)**: TypeScript type checker (watch mode)
- 🟢 **Terminal 3 (BUILD)**: Monitoring ve log sistemi

## 🎨 GUI ve Terminal Entegrasyonu

### VS Code Terminal Split

VS Code kullanıyorsanız, `.vscode/tasks.json` dosyası oluşturun:

```json
{
  "version": "2.0.0",
  "tasks": [
    {
      "label": "Start All Services",
      "type": "shell",
      "command": "npm run start:all",
      "presentation": {
        "reveal": "always",
        "panel": "dedicated"
      },
      "problemMatcher": []
    },
    {
      "label": "Dev Server",
      "type": "npm",
      "script": "dev",
      "presentation": {
        "group": "services",
        "reveal": "always"
      }
    },
    {
      "label": "Type Check",
      "type": "shell",
      "command": "npx tsc --noEmit --watch",
      "presentation": {
        "group": "services",
        "reveal": "always"
      }
    }
  ]
}
```

**Çalıştırma:**
- `Ctrl+Shift+P` → `Tasks: Run Task` → `Start All Services`

### Tmux ile Terminal Yönetimi

```bash
# Tmux session oluştur
tmux new-session -d -s cyber-ui

# Pencereleri böl
tmux split-window -h
tmux split-window -v

# Her panede komut çalıştır
tmux send-keys -t 0 'npm run dev' C-m
tmux send-keys -t 1 'npx tsc --noEmit --watch' C-m
tmux send-keys -t 2 'npm run build && npm run preview' C-m

# Session'a bağlan
tmux attach-session -t cyber-ui
```

## 🚦 Hızlı Komutlar

| Komut | Açıklama |
|-------|----------|
| `npm install` | Tüm bağımlılıkları yükle |
| `npm run dev` | Development server başlat (http://localhost:5173) |
| `npm run build` | Production build oluştur |
| `npm run preview` | Production build'i önizle |
| `npx tsc --noEmit` | TypeScript type check |

## 🔐 Environment Variables

Projenin çalışması için gerekli environment değişkenleri:

```env
# .env.local
GEMINI_API_KEY=your_gemini_api_key_here
```

## 📝 Development Workflow

1. **Proje klonlama ve kurulum:**
   ```bash
   git clone <repo-url>
   cd Cyber-UI
   npm install
   ```

2. **Environment setup:**
   ```bash
   cp .env.example .env.local
   # .env.local dosyasını düzenle
   ```

3. **Development başlat:**
   ```bash
   npm run dev
   ```

4. **Browser'da aç:**
   ```
   http://localhost:5173
   ```

## 🐛 Troubleshooting

### Port zaten kullanımda
```bash
# Port 5173 kullanımdaysa
npx kill-port 5173
npm run dev
```

### Node modules sorunları
```bash
rm -rf node_modules package-lock.json
npm install
```

### TypeScript hataları
```bash
npx tsc --noEmit
```

## 🎯 Production Build

```bash
# Build oluştur
npm run build

# Build'i test et
npm run preview

# Dist klasörünü deploy et
# dist/ klasörü production-ready dosyaları içerir
```

## 🔄 Git Workflow

```bash
# Feature branch oluştur
git checkout -b feature/your-feature

# Değişiklikleri commit et
git add .
git commit -m "feat: your feature description"

# Push et
git push origin feature/your-feature
```

## 📚 Ek Kaynaklar

- [Vite Documentation](https://vitejs.dev/)
- [React Documentation](https://react.dev/)
- [Google Gemini API](https://ai.google.dev/)
- [TypeScript Handbook](https://www.typescriptlang.org/docs/)

## 🤝 Katkıda Bulunma

1. Fork yapın
2. Feature branch oluşturun (`git checkout -b feature/AmazingFeature`)
3. Değişikliklerinizi commit edin (`git commit -m 'Add some AmazingFeature'`)
4. Branch'inizi push edin (`git push origin feature/AmazingFeature`)
5. Pull Request oluşturun

## 📄 Lisans

Bu proje özel bir projedir.

---

**Son Güncelleme:** 2026-01-13
**Geliştirici:** Cyber-UI Team
**Status:** 🟢 Active Development
