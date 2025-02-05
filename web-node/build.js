const fs = require("fs-extra");
const path = require("path");
const ejs = require("ejs");

// Define paths
const srcFolder = path.join(__dirname, "views"); // EJS templates
const distFolder = path.join(__dirname, "dist"); // Output folder
const staticFolder = path.join(__dirname, "public"); // Static assets

// Ensure output directory exists
fs.ensureDirSync(distFolder);

// Function to compile EJS templates
const compileEJS = () => {
  fs.readdirSync(srcFolder).forEach((file) => {
    if (path.extname(file) === ".ejs") {
      const filePath = path.join(srcFolder, file);
      const outputFileName = file.replace(".ejs", ".html");
      const outputPath = path.join(distFolder, outputFileName);

      const template = fs.readFileSync(filePath, "utf-8");

      // Render EJS with sample data (modify as needed)
      const html = ejs.render(template, {
        title: "My Express App",
      });

      fs.writeFileSync(outputPath, html);
      console.log(`✔ Compiled: ${outputFileName}`);
    }
  });
};

// Function to copy static assets
const copyStaticAssets = () => {
  if (fs.existsSync(staticFolder)) {
    fs.copySync(staticFolder, path.join(distFolder, "assets"));
    console.log("✔ Static assets copied!");
  } else {
    console.warn("⚠ No static assets folder found.");
  }
};

// Run the build process
console.log("🔨 Building project...");
compileEJS();
copyStaticAssets();
console.log("✅ Build complete!");
